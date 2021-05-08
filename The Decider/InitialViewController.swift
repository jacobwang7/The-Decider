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
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!
    @IBOutlet weak var imageView11: UIImageView!
    @IBOutlet weak var imageView12: UIImageView!
    
    @IBOutlet weak var choiceLabel: UILabel!
    
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
        imageView6.alpha = 0.0
        imageView7.alpha = 0.0
        imageView8.alpha = 0.0
        imageView9.alpha = 0.0
        imageView10.alpha = 0.0
        imageView11.alpha = 0.0
        imageView12.alpha = 0.0
        
        imageView1.layer.cornerRadius = 50
        imageView1.clipsToBounds = true
        imageView1.layer.borderWidth = 5
        imageView1.layer.borderColor = UIColor.white.cgColor
        
        imageView2.layer.cornerRadius = 50
        imageView2.clipsToBounds = true
        imageView2.layer.borderWidth = 5
        imageView2.layer.borderColor = UIColor.white.cgColor
        
        imageView3.layer.cornerRadius = 50
        imageView3.clipsToBounds = true
        imageView3.layer.borderWidth = 5
        imageView3.layer.borderColor = UIColor.white.cgColor
        
        imageView4.layer.cornerRadius = 50
        imageView4.clipsToBounds = true
        imageView4.layer.borderWidth = 5
        imageView4.layer.borderColor = UIColor.white.cgColor
        
        imageView5.layer.cornerRadius = 50
        imageView5.clipsToBounds = true
        imageView5.layer.borderWidth = 5
        imageView5.layer.borderColor = UIColor.white.cgColor
        
        imageView6.layer.cornerRadius = 50
        imageView6.clipsToBounds = true
        imageView6.layer.borderWidth = 5
        imageView6.layer.borderColor = UIColor.white.cgColor
        
        imageView7.layer.cornerRadius = 50
        imageView7.clipsToBounds = true
        imageView7.layer.borderWidth = 5
        imageView7.layer.borderColor = UIColor.white.cgColor
        
        imageView8.layer.cornerRadius = 50
        imageView8.clipsToBounds = true
        imageView8.layer.borderWidth = 5
        imageView8.layer.borderColor = UIColor.white.cgColor
        
        imageView9.layer.cornerRadius = 50
        imageView9.clipsToBounds = true
        imageView9.layer.borderWidth = 5
        imageView9.layer.borderColor = UIColor.white.cgColor
        
        imageView10.layer.cornerRadius = 50
        imageView10.clipsToBounds = true
        imageView10.layer.borderWidth = 5
        imageView10.layer.borderColor = UIColor.white.cgColor
        
        imageView11.layer.cornerRadius = 50
        imageView11.clipsToBounds = true
        imageView11.layer.borderWidth = 5
        imageView11.layer.borderColor = UIColor.white.cgColor
        
        imageView12.layer.cornerRadius = 50
        imageView12.clipsToBounds = true
        imageView12.layer.borderWidth = 5
        imageView12.layer.borderColor = UIColor.white.cgColor

        UIView.animate(withDuration: 1.0) {
            self.imageView1.alpha = 1.0
            self.imageView2.alpha = 1.0
            self.imageView3.alpha = 1.0
            self.imageView4.alpha = 1.0
            self.imageView5.alpha = 1.0
            self.imageView6.alpha = 1.0
            self.imageView7.alpha = 1.0
            self.imageView8.alpha = 1.0
            self.imageView9.alpha = 1.0
            self.imageView10.alpha = 1.0
            self.imageView11.alpha = 1.0
            self.imageView12.alpha = 1.0
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FirstRound" {
            let destination = segue.destination as! SwipeViewController
            destination.firstRoundFoods = foods
        }
    }

    @IBAction func imageView1Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("burgers")
        playSound(name: "good-choice")
        choiceLabel.text = "Burgers Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView1.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView2Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("chinese")
        playSound(name: "good-choice")
        choiceLabel.text = "Chinese Food Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView2.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView3Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("curry")
        playSound(name: "good-choice")
        choiceLabel.text = "Curry Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView3.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView4Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("italian")
        playSound(name: "good-choice")
        choiceLabel.text = "Italian Food Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView4.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView5Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("sushi")
        playSound(name: "good-choice")
        choiceLabel.text = "Sushi Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView5.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView6Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("fried chicken")
        playSound(name: "good-choice")
        choiceLabel.text = "Fried Chicken Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView6.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView7Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("mexican")
        playSound(name: "good-choice")
        choiceLabel.text = "Mexican Food Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView7.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView8Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("pizza")
        playSound(name: "good-choice")
        choiceLabel.text = "Pizza Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView8.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView9Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("salad")
        playSound(name: "good-choice")
        choiceLabel.text = "Salad Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView9.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView10Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("sandwiches")
        playSound(name: "good-choice")
        choiceLabel.text = "Sandwiches Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView10.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView11Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("seafood")
        playSound(name: "good-choice")
        choiceLabel.text = "Seafood Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView11.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
        checkIfReady()
    }
    
    @IBAction func imageView12Tapped(_ sender: UITapGestureRecognizer) {
        foods.append("tapas")
        playSound(name: "good-choice")
        choiceLabel.text = "Tapas Added!"
        UIView.animate(withDuration: 1.0) {
            self.imageView12.alpha = 0.0
            self.choiceLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 1.0) {
            self.choiceLabel.alpha = 0.0
        }
        print(foods)
        foods.shuffle()
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

