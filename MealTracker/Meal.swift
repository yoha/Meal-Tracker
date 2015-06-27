//
//  Meal.swift
//  MealTracker
//
//  Created by Yohannes Wijaya on 6/27/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: - Properties
    
    var mealName: String
    var mealPhoto: UIImage?
    var mealRating: Int
    
    // MARK: - Initialization
    
    init?(mealName: String, mealPhoto: UIImage?, mealRating: Int) {
        self.mealName = mealName
        self.mealPhoto = mealPhoto
        self.mealRating = mealRating
        if mealName.isEmpty || mealRating < 0 { return nil }
    }
}