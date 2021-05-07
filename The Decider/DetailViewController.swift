//
//  DetailViewController.swift
//  The Decider
//
//  Created by Jacob Wang on 5/6/21.
//

import UIKit

class DetailViewController: UIViewController {

    var logItem: LogItem!
    
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var restaurantTextField: UITextField!
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if logItem == nil {
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            formatter.dateStyle = .short
            let dateTimeString = formatter.string(from: currentDateTime)
            dateTextField.text = dateTimeString
            logItem = LogItem(result: "", date: dateTimeString, restaurant: "", food: "")
        }
        
        resultTextField.text = logItem.result
        restaurantTextField.text = logItem.restaurant
        foodTextField.text = logItem.food
        dateTextField.text = logItem.date
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        logItem.result = resultTextField.text!
        logItem.restaurant =  restaurantTextField.text!
        logItem.food = foodTextField.text!
        logItem.date = dateTextField.text!
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = self.presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
