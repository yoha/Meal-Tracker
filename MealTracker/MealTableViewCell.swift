//
//  MealTableViewCell.swift
//  MealTracker
//
//  Created by Yohannes Wijaya on 6/27/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealRatingControl: RatingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
