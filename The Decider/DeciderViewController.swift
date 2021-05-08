//
//  DeciderViewController.swift
//  The Decider
//
//  Created by Jacob Wang on 5/5/21.
//

import UIKit
import iOSLuckyWheel
import AVFoundation

class DeciderViewController: UIViewController, LuckyWheelDataSource, LuckyWheelDelegate {
    
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    var audioPlayer: AVAudioPlayer!
    var wheel :LuckyWheel?
    var finalFoods: [String] = []
    var colors: [UIColor] = [.red, .orange, .magenta, .darkGray, .link, .brown, .systemPurple, .green, .lightGray, .blue, .systemPink, .systemIndigo]
    var foodWheelItems: [WheelItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logButton.alpha = 0.0
        logButton.isEnabled = false
        returnButton.alpha = 0.0
        returnButton.isEnabled = false
        wheel = LuckyWheel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 40 , height: 300))
        wheel?.delegate = self
        wheel?.dataSource = self
        wheel?.center = self.view.center
        wheel?.setTarget(section: finalFoods.count)
        wheel?.animateLanding = true
        self.view.addSubview(wheel!)
        print("final round foods: \(finalFoods)")
        print("final round foods count = \(finalFoods.count)")
        playSound(name: "waiting")
    }
    
    func numberOfSections() -> Int {
        return finalFoods.count
    }
    
    func itemsForSections() -> [WheelItem] {
        for i in 0..<finalFoods.count {
            let item = WheelItem(title: finalFoods[i].capitalized, titleColor: UIColor.white, itemColor: colors[i])
            foodWheelItems.append(item)
        }
        
        return foodWheelItems
    }
    
    func wheelDidChangeValue(_ newValue: Int) {
        print(newValue)
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        playSound(name: "congrats")
        logButton.isEnabled = true
        UIView.animate(withDuration: 0.5) {
            self.logButton.alpha = 1.0
        }
        returnButton.isEnabled = true
        UIView.animate(withDuration: 0.5) {
            self.returnButton.alpha = 1.0
        }
        
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object")
            }
        } else {
            print("😡 ERROR: Could not read data from file sound0")
        }
    }
    
    @IBAction func returnButtonPressed(_ sender: UIButton) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
    }
    
}


