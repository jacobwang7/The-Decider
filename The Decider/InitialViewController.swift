//
//  InitialViewController.swift
//  The Decider
//
//  Created by Jacob Wang on 5/5/21.
//

import UIKit
import AVFoundation

class InitialViewController: UIViewController {
    @IBOutlet weak var readyButton: UIButton!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var americanLabel: UILabel!
    @IBOutlet weak var chineseLabel: UILabel!
    @IBOutlet weak var indianLabel: UILabel!
    @IBOutlet weak var italianLabel: UILabel!
    @IBOutlet weak var japaneseLabel: UILabel!
    
    var foods: [String] = []
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readyButton.isEnabled = false
        readyButton.alpha = 0.0
        
        imageView1.alpha = 0.0
        imageView2.alpha = 0.0
        imageView3.alpha = 0.0
        imageView4.alpha = 0.0
        imageView5.alpha = 0.0
        
        americanLabel.isHidden = true
        chineseLabel.isHidden = true
        indianLabel.isHidden = true
        italianLabel.isHidden = true
        japaneseLabel.isHidden = true
        
        imageView1.frame.size.width = 150
        imageView1.frame.size.height = 150
        imageView1.layer.cornerRadius = 55.5
        imageView1.clipsToBounds = true
        imageView1.layer.borderWidth = 5
        imageView1.layer.borderColor = UIColor.white.cgColor
        
        imageView2.frame.size.width = 150
        imageView2.frame.size.height = 150
        imageView2.layer.cornerRadius = 55.5
        imageView2.clipsToBounds = true
        imageView2.layer.borderWidth = 5
        imageView2.layer.borderColor = UIColor.white.cgColor
        
        imageView3.frame.size.width = 150
        imageView3.frame.size.height = 150
        imageView3.layer.cornerRadius = 55.5
        imageView3.clipsToBounds = true
        imageView3.layer.borderWidth = 5
        imageView3.layer.borderColor = UIColor.white.cgColor
        
        imageView4.frame.size.width = 150
        imageView4.frame.size.height = 150
        imageView4.layer.cornerRadius = 55.5
        imageView4.clipsToBounds = true
        imageView4.layer.borderWidth = 5
        imageView4.layer.borderColor = UIColor.white.cgColor
        
        imageView5.frame.size.width = 150
        imageView5.frame.size.height = 150
        imageView5.layer.cornerRadius = 55.5
        imageView5.clipsToBounds = true
        imageView5.layer.borderWidth = 5
        imageView5.layer.borderColor = UIColor.white.cgColor

        UIView.animate(withDuration: 1.0) {
            self.imageView1.alpha = 1.0
            self.imageView2.alpha = 1.0
            self.imageView3.alpha = 1.0
            self.imageView4.alpha = 1.0
            self.imageView5.alpha = 1.0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FirstRound" {
            let destination = segue.destination as! SwipeViewController
            destination.firstRoundFoods = foods
        }
    }

    @IBAction func americanTapped(_ sender: UITapGestureRecognizer) {
        foods.append("american")
        playSound(name: "good-choice")
        UIView.animate(withDuration: 1.0) {
            self.imageView1.alpha = 0.0
        }
        americanLabel.isHidden = false
        print(foods)
        checkIfReady()
    }
    
    @IBAction func chineseTapped(_ sender: UITapGestureRecognizer) {
        foods.append("chinese")
        playSound(name: "good-choice")
        UIView.animate(withDuration: 1.0) {
            self.imageView2.alpha = 0.0
        }
        chineseLabel.isHidden = false
        print(foods)
        checkIfReady()
    }
    
    @IBAction func indianTapped(_ sender: UITapGestureRecognizer) {
        foods.append("indian")
        playSound(name: "good-choice")
        UIView.animate(withDuration: 1.0) {
            self.imageView3.alpha = 0.0
        }
        indianLabel.isHidden = false
        print(foods)
        checkIfReady()
    }
    
    @IBAction func italianTapped(_ sender: UITapGestureRecognizer) {
        foods.append("italian")
        playSound(name: "good-choice")
        UIView.animate(withDuration: 1.0) {
            self.imageView4.alpha = 0.0
        }
        italianLabel.isHidden = false
        print(foods)
        checkIfReady()
    }
    
    @IBAction func japaneseTapped(_ sender: UITapGestureRecognizer) {
        foods.append("japanese")
        playSound(name: "good-choice")
        UIView.animate(withDuration: 1.0) {
            self.imageView5.alpha = 0.0
        }
        japaneseLabel.isHidden = false
        print(foods)
        checkIfReady()
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
    
    func checkIfReady() {
        if foods.count > 0 {
            readyButton.isEnabled = true
            UIView.animate(withDuration: 0.5) {
                self.readyButton.alpha = 1.0
            }
        }
    }
    
}

