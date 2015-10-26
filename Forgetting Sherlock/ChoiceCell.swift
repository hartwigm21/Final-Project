//
//  ChoiceCell.swift
//  Forgetting Sherlock
//
//  Created by Matthew Hartwig on 10/10/15.
//  Copyright © 2015 Matthew Hartwig. All rights reserved.
//

import UIKit



class ChoiceCell: UITableViewCell {

    @IBOutlet weak var choiceOne: UIButton!
    
    @IBOutlet weak var choiceTwo: UIButton!
    
    var storyTracker = StoryTracker()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 8
        choiceOne.layer.cornerRadius = 10
        choiceTwo.layer.cornerRadius = 10
        choiceOne.contentEdgeInsets.right = 10
        choiceOne.contentEdgeInsets.left = 10
        choiceTwo.contentEdgeInsets.right = 10
        choiceTwo.contentEdgeInsets.left = 10
        storyTracker.updateChoices(choiceOne, choiceSecond: choiceTwo)
            
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSelectFirstChoice(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("0", object: nil, userInfo: nil)
    }
    
   
    @IBAction func didSelectSecondChoice(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("1", object:nil, userInfo:nil)
    }

}
