//
//  TextCell.swift
//  Forgetting Sherlock
//
//  Created by Matthew Hartwig on 10/10/15.
//  Copyright © 2015 Matthew Hartwig. All rights reserved.
//

import UIKit


class TextCell: UITableViewCell {

    
    @IBOutlet weak var storyText: UILabel!
    //var storyTracker = StoryTracker()
    
  
        
    override func awakeFromNib() {
        super.awakeFromNib()
        storyText.layer.masksToBounds = true
        storyText.layer.cornerRadius = 8.00
        //storyTracker.updateText(storyText,)
        // Initialization code
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    

}
