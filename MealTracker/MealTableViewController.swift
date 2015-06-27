//
//  MealTableViewController.swift
//  MealTracker
//
//  Created by Yohannes Wijaya on 6/27/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        showSampleMeals()
    }
    
    func showSampleMeals() {
        let firstSampleMeal = Meal(mealName: "Tomato Salad", mealPhoto: UIImage(named: "tomatoSalad"), mealRating: 3)!
        let secondSampleMeal = Meal(mealName: "Grilled Chicken", mealPhoto: UIImage(named: "grilledChicken"), mealRating: 5)!
        let thirdSampleMeal = Meal(mealName: "Spaghetti", mealPhoto: UIImage(named: "spaghetti"), mealRating: 4)!
        meals += [firstSampleMeal, secondSampleMeal, thirdSampleMeal]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source methods

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reusableCellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(reusableCellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        let eachMeal = meals[indexPath.row]
        cell.mealImageView.image = eachMeal.mealPhoto
        cell.mealNameLabel.text = eachMeal.mealName
        cell.mealRatingControl.selectedRating = eachMeal.mealRating
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
