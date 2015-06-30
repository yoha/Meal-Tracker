//
//  MealViewController.swift
//  MealTracker
//
//  Created by Yohannes Wijaya on 6/24/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveMealBarButton: UIBarButtonItem!
    
    var meal: Meal?
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveMealBarButton === sender {
            let mealName = mealNameTextField.text ?? ""
            let mealPhoto = photoImageView.image
            let mealRating = ratingControl.selectedRating
            meal = Meal(mealName: mealName, mealPhoto: mealPhoto, mealRating: mealRating)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        mealNameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func cancelNewMeal(sender: UIBarButtonItem) {
        if presentingViewController is UINavigationController {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveMealBarButton.enabled = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        mealNameTextField.resignFirstResponder()
        return true
    }
    
    func checkIsMealNameValid() {
        let isMealNameValid = mealNameTextField.text ?? ""
        saveMealBarButton.enabled = !isMealNameValid.isEmpty
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkIsMealNameValid()
        navigationItem.title = mealNameTextField.text
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Identify this view controller as its delegate
        mealNameTextField.delegate = self
        
        if let meal = meal {
            navigationItem.title = meal.mealName
            mealNameTextField.text = meal.mealName
            photoImageView.image = meal.mealPhoto
            ratingControl.selectedRating = meal.mealRating
        }
        
        checkIsMealNameValid()
    }

}

