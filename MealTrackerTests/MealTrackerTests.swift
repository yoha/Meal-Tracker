//
//  MealTrackerTests.swift
//  MealTrackerTests
//
//  Created by Yohannes Wijaya on 6/24/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import XCTest

class MealTrackerTests: XCTestCase {
    
    // MARK: - MealTracker Tests
    
    func testMealInitializationWithNoNameOrNegativeRating() {
        let successCase = Meal(mealName: "Spaghetti", mealPhoto: nil, mealRating: 5)
        XCTAssertNotNil(successCase)
        
        let failureCaseNoMealName = Meal(mealName:"", mealPhoto: nil, mealRating: 4)
        XCTAssertNil(failureCaseNoMealName, "Empty meal name is not valid")
        
        let failureCaseNoMealRating = Meal(mealName:"Burger", mealPhoto: nil, mealRating: -1)
        XCTAssertNil(failureCaseNoMealRating, "Empty meal rating is not valid")
    }
}
