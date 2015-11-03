//
//  StoryTracker.swift
//  Forgetting Sherlock
//
//  Created by Matthew Hartwig on 10/12/15.
//  Copyright © 2015 Matthew Hartwig. All rights reserved.
//

import UIKit

struct Story {
    
    var title:String
    var subtitle:String
    var browsed:Bool = false
    
    init(title:String, subtitle:String = ""){
        
        self.title = title
        self.subtitle = subtitle
        
    }
    
}


class StoryTracker: NSObject {
        
    var dict: [Int: Story] =   [0: Story(title: "And so the story begins..."),
                                1: Story(title: "Holmes what are you doing?",
                                         subtitle: "Holmes, that makes no sense."),
                                2: Story(title: "Dammit Watson, that's no help!"),
                                3: Story(title: "Words",
                                         subtitle: "word"),
                                4: Story(title: "We have no choice"),
                                5: Story(title: "Holmes that makes no sense.",
                                         subtitle: "Holmes you are a genius"),
                                6: Story(title: "We have no choice"),
                                7: Story(title: "Holmes that makes no sense.",
                                         subtitle: "Holmes you are a genius")]
    
    var rowTracker: Array = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    
    var currentPlace: Int = 0
    
    var numRowsAccessor:[Int] {
        set {
            
        }
        get {
           return rowTracker
        }
  
    }
    
    
    var numSections: Int = 2
    var numSectionsAccessor:Int {
        set {

        }
        get {
            return numSections
        }
    }
    
    
    override init() {
        super.init()
        
        
    }
    //Replace these with notifications
    
    func updateChoices(choiceFirst: UIButton, choiceSecond: UIButton) {

        let position = currentPlace + 1
        let choice:Story = dict[position]!
    
        choiceFirst.setTitle(choice.title,forState: .Normal)
        choiceSecond.setTitle(choice.subtitle,forState: .Normal)
        
        //return choiceArray!
    }
    
    func updateText(storyDisplayer: UILabel) {
        let position = currentPlace
        let story:Story = dict[position]!
        storyDisplayer.text = story.title
    }
    

    func firstChoiceUpdate() {
        
        currentPlace += 1
        numSections  += 2
        print(numSections)
        
        NSNotificationCenter.defaultCenter().postNotificationName("received", object: nil)
    }
    
    func secondChoiceUpdate() {
        
        currentPlace += 2
        numSections  += 2
        
        NSNotificationCenter.defaultCenter().postNotificationName("received", object: nil)

    }
    
}

