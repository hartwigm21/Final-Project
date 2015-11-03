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
    
    private var _storyTracker:StoryTracker!
    var tracker:StoryTracker {
        
        get {
            
            return _storyTracker
            
        }
        
        set {
            
            _storyTracker = newValue
            
        }
        
    }
        
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
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSelectFirstChoice(sender: AnyObject) {
       tracker.firstChoiceUpdate()
        choiceOne.enabled = false
        choiceTwo.enabled = false
        choiceOne.selected = true
    }
    
   
    @IBAction func didSelectSecondChoice(sender: AnyObject) {
        tracker.secondChoiceUpdate()
        choiceOne.enabled = false
        choiceTwo.enabled = false


    }
    


}
