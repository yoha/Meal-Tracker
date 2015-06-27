//
//  RatingControl.swift
//  MealTracker
//
//  Created by Yohannes Wijaya on 6/26/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: - Properties
    
    var ratingButtons = [UIButton]()
    let ratingIndex = 5
    var selectedRating = 0 {
        didSet {
             setNeedsLayout()
        }
    }
    
    // MARK: - Initialization
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")!
        let emptyStarImage = UIImage(named: "emptyStar")!
        
        for _ in 0..<ratingIndex {
            let ratingButton = UIButton()
            ratingButton.setImage(emptyStarImage, forState: .Normal)
            ratingButton.setImage(filledStarImage, forState: .Selected)
            ratingButton.setImage(filledStarImage, forState: [.Selected, .Highlighted])
            ratingButton.adjustsImageWhenHighlighted = false
            ratingButton.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [ratingButton]
            addSubview(ratingButton)
        }
    }
    
    override func layoutSubviews() {
        let ratingButtonSize = Int(frame.size.height)
        let marginBetweenButtons = 5
        var ratingButtonFrame = CGRect(x: 0, y: 0, width: ratingButtonSize, height: ratingButtonSize)
        for (index, button) in ratingButtons.enumerate() {
            ratingButtonFrame.origin.x = CGFloat(index * (ratingButtonSize + marginBetweenButtons))
            button.frame = ratingButtonFrame
        }
         updateRatingButtonSelectionState()
    }
    
    // MARK: - Actions
    
    func ratingButtonTapped(button: UIButton) {
        selectedRating = ratingButtons.indexOf(button)! + 1
        updateRatingButtonSelectionState()
    }
    
    func updateRatingButtonSelectionState() {
        for (index, button) in ratingButtons.enumerate() {
            button.selected = selectedRating > index
        }
    }
}
