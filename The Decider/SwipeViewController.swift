//
//  SwipeViewController.swift
//  The Decider
//
//  Created by Jacob Wang on 5/5/21.
//

import UIKit
import AVFoundation

class SwipeViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var childView: UIView!
    
    var firstRoundFoods: [String] = []
    var finalRoundFoods: [String] = []
    var images: [UIImageView] = []
    var timer = Timer()
    var audioPlayer: AVAudioPlayer!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.isUserInteractionEnabled = true
        self.childView.isUserInteractionEnabled = true
        
        for i in 0..<firstRoundFoods.count {
            let foodImage = UIImage(named: firstRoundFoods[i])
            let myImageView: UIImageView = UIImageView()
            myImageView.contentMode = UIView.ContentMode.scaleAspectFill
            myImageView.frame.size.width = 200
            myImageView.frame.size.height = 200
            myImageView.center = self.view.center
            myImageView.image = foodImage
            // Make Image Corners Rounded
            myImageView.layer.cornerRadius = 100
            myImageView.clipsToBounds = true
            myImageView.layer.borderWidth = 10
            myImageView.layer.borderColor = UIColor.lightGray.cgColor
     
            view.addSubview(myImageView)
            self.view = view
            images.append(myImageView)
        }
        
        feedbackLabel.alpha = 0.0

        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(SwipeViewController.doStuff), userInfo: nil, repeats: true)
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc func doStuff() {
        // perform any action you wish to
        self.view.isUserInteractionEnabled = false
        self.childView.isUserInteractionEnabled = false
        print("User inactive for more than 2 seconds .")
        timer.invalidate()
        if firstRoundFoods.count != 0 {
            UIView.animate(withDuration: 0.1, animations: {
                self.childView.backgroundColor = UIColor.red
            }) { (_) in
                self.childView.backgroundColor = UIColor.white
            }
            
            playSound(name: "incorrect")
            
            let originalImageFrame = imageView.frame
            let imageWidthShrink: CGFloat = 20
            let imageHeightShrink: CGFloat = 20
            let smallerImageFrame = CGRect(
                x: imageView.frame.origin.x + imageWidthShrink,
                y: imageView.frame.origin.y + imageHeightShrink,
                width: imageView.frame.width - (imageWidthShrink * 2),
                height: imageView.frame.height - (imageHeightShrink * 2))
            imageView.frame = smallerImageFrame
            UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: {self.imageView.frame = originalImageFrame})
            
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer?) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(SwipeViewController.doStuff), userInfo: nil, repeats: true)
        
        if let swipeGesture = sender {
            switch swipeGesture.direction {
            case .right:
                playSound(name: "swipe-effect")
                feedbackLabel.text = "Good Choice!"
                let count = images.count
                finalRoundFoods.append(firstRoundFoods[count-1])
                if index < firstRoundFoods.count {
                    index += 1
                }
                UIView.animate(withDuration: 0.5, animations: {self.images[count-1].center.x = self.view.frame.width + self.images[count-1].frame.width})
                UIView.animate(withDuration: 0.1) {
                    self.feedbackLabel.alpha = 1.0
                }
                let seconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    UIView.animate(withDuration: 0.1) {
                        self.feedbackLabel.alpha = 0.0
                    }
                }
                images.removeLast()
                firstRoundFoods.removeLast()
                print(firstRoundFoods)
                checkForLast()
            case .left:
                playSound(name: "swipe-effect")
                feedbackLabel.text = "Alright, we'll toss that choice!"
                let count = images.count
                UIView.animate(withDuration: 0.5, animations: {self.images[count-1].center.x = -self.view.frame.width})
                UIView.animate(withDuration: 0.1) {
                    self.feedbackLabel.alpha = 1.0
                }
                let seconds = 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    UIView.animate(withDuration: 0.1) {
                        self.feedbackLabel.alpha = 0.0
                    }
                }
                if index < firstRoundFoods.count {
                    index += 1
                }
                images.removeLast()
                firstRoundFoods.removeLast()
                print(firstRoundFoods)
                checkForLast()
            default:
                print("error")
            }
        }
        
    }
    
    func checkForLast() {
        if firstRoundFoods.count == 0 {
            self.view.isUserInteractionEnabled = false
            self.childView.isUserInteractionEnabled = false
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                //print("final foods: \(self.finalRoundFoods)")
                self.performSegue(withIdentifier: "FinalRound", sender: nil)
            }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FinalRound" {
            let destination = segue.destination as! DeciderViewController
            destination.finalFoods = finalRoundFoods
        }
    }
  
}
