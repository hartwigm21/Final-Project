//
//  ChoiceCell.swift
//  Forgetting Sherlock
//
//  Created by Matthew Hartwig on 10/10/15.
//  Copyright © 2015 Matthew Hartwig. All rights reserved.
//

import UIKit



class ChoiceCell: UITableViewCell {

    let myFirstLabel = UILabel()
    
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
        choiceOne.contentEdgeInsets.right = 5
        choiceOne.contentEdgeInsets.left = 5
        choiceTwo.contentEdgeInsets.right = 5
        choiceTwo.contentEdgeInsets.left = 5
        choiceOne.contentEdgeInsets.top = 1
        choiceTwo.contentEdgeInsets.top = 1
        
        choiceOne.titleEdgeInsets.left = 5; // this line of code add padding from left side of button.
        choiceOne.titleEdgeInsets.right = 5; // this line of code add padding from right side of button.
        choiceOne.titleEdgeInsets.top = 1; // this line of code add padding from top side of button.
        choiceOne.titleEdgeInsets.bottom = 1; // this line of code add padding from bottom side of button.
        
        
        choiceTwo.titleEdgeInsets.left = 10; // this line of code add padding from left side of button.
        choiceTwo.titleEdgeInsets.right = 10; // this line of code add padding from right side of button.
        choiceTwo.titleEdgeInsets.top = 1; // this line of code add padding from top side of button.
        choiceTwo.titleEdgeInsets.bottom = 1; // this line of code add padding from bottom side of button.
        
        choiceOne.titleLabel?.numberOfLines = 0
        choiceTwo.titleLabel?.numberOfLines = 0
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didSelectFirstChoice(sender: AnyObject) {
       tracker.firstChoiceUpdate()
        choiceOne.enabled = false
        choiceTwo.enabled = false
        choiceOne.setTitleShadowColor(UIColor.blueColor(), forState:
            .Normal)
    }
    
   
    @IBAction func didSelectSecondChoice(sender: AnyObject) {
        tracker.secondChoiceUpdate()
        choiceOne.enabled = false
        choiceTwo.enabled = false


    }
    


}
