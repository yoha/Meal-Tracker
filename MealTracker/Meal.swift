//
//  Meal.swift
//  MealTracker
//
//  Created by Yohannes Wijaya on 6/27/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: - Properties
    
    var mealName: String
    var mealPhoto: UIImage?
    var mealRating: Int
    
    // MARK: - Types
    
    struct PropertyKey {
        static let mealNameKey = "mealName"
        static let mealPhotoKey = "mealPhoto"
        static let mealRatingKey = "mealRating"
    }
    
    // Mark: - Archiving Path
    
    static let documentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let archiveURL = documentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: - Initialization
    
    init?(mealName: String, mealPhoto: UIImage?, mealRating: Int) {
        self.mealName = mealName
        self.mealPhoto = mealPhoto
        self.mealRating = mealRating
        super.init()
        if mealName.isEmpty || mealRating < 0 { return nil }
    }
    
    // MARK: - NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(mealName, forKey: PropertyKey.mealNameKey)
        aCoder.encodeObject(mealPhoto, forKey: PropertyKey.mealPhotoKey)
        aCoder.encodeInteger(mealRating, forKey: PropertyKey.mealRatingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let mealNameDecoded = aDecoder.decodeObjectForKey(PropertyKey.mealNameKey) as! String
        let mealPhotoDecoded = aDecoder.decodeObjectForKey(PropertyKey.mealPhotoKey) as? UIImage
        let mealRatingDecoded = aDecoder.decodeIntegerForKey(PropertyKey.mealRatingKey)
        self.init(mealName: mealNameDecoded, mealPhoto: mealPhotoDecoded, mealRating: mealRatingDecoded)
    }
}