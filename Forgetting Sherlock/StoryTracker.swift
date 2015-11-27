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
        
    var dict: [Int: Story] =   [0: Story(title: "Come Watson, Come. The game is afoot. Not a word, into your clothes and come!"),
                                1: Story(title: "Holmes, is that you?",
                                         subtitle: "Uhm, who is this?"),
                                2: Story(title: "Dammit Watson, it's me! Your very old friend, Sherlock Holmes."),
                                3: Story(title: "Holmes? Is everything okay? It's been some time since I've heard from you.",
                                         subtitle: "Holmes! It's wonderful to hear from you."),
                                4: Story(title: "Watson my old friend. I'm in need of your assistance once again. You see, well... ah where was I?"),
                                5: Story(title: "Holmes, are you alright?",
                                         subtitle: "Hurry up with it, spit it out!"),
                                6: Story(title: "Yes, yes, I remember now. I've observed a set of curious incidents and I'm needed to piece these incidents together. But Watson, you see, my mind is not what it once was. I... I can't quite remember what my physician termed it, but things slip from me. To solve this mystery I'll need your help. What do you say old friend?"),
                                7: Story(title: "Your mind? Holmes, we must focus on your health.",
                                         subtitle: "I must admit, I've been waiting for another adventure. One last one, shall we say?"),
                                8: Story(title: "That's the spirit... to be continued")]
    
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

