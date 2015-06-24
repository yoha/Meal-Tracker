//
//  MealViewController.swift
//  MealTracker
//
//  Created by Yohannes Wijaya on 6/24/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!
    
    // MARK: - Actions
    
    @IBAction func setDefaultMealName(sender: UIButton) {
        mealLabel.text = "Spaghtetti"
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        mealNameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealLabel.text = mealNameTextField.text
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Identify this view controller as its delegate
        mealNameTextField.delegate = self
    }

}

