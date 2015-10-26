//
//  StoryTracker.swift
//  Forgetting Sherlock
//
//  Created by Matthew Hartwig on 10/12/15.
//  Copyright © 2015 Matthew Hartwig. All rights reserved.
//

import UIKit


class StoryTracker: NSObject {
        
    var dict: [Int: Array] = [0: ["And so the story begins..."], 1: ["Watson what should I do?"], 2: ["Dammit Watson, that's no help!"]]
    
    var currentPlace: Int = 0
    
    var choices: [Int: Array] = [0: ["Yes", "No"], 1: ["Hey", "Ho"]]
    
    
    override init() {
        super.init()
    }

    
    func updateChoices(choiceFirst: UIButton, choiceSecond: UIButton) {
        let position = currentPlace
        let displayChoices = choices
        let choiceArray = displayChoices[position]
        if let choiceArray = choiceArray {
        choiceFirst.setTitle(choiceArray[0],forState: .Normal)
        choiceSecond.setTitle(choiceArray[1],forState: .Normal)
        }
        //return choiceArray!
    }
    
    func listenForCurrentPlace() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "firstChoiceUpdate", name: "0", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "secondChoiceUpdate", name: "0", object: nil)
        var numRows = currentPlace + 1
        NSNotificationCenter.defaultCenter().postNotificationName(String(numRows), object: nil, userInfo: nil)
        
        NSNotificationCenter.defaultCenter().postNotificationName(<#T##aName: String##String#>, object: <#T##AnyObject?#>, userInfo: <#T##[NSObject : AnyObject]?#>)
    }
    
    
    func firstChoiceUpdate() {
        currentPlace + 1
    }
    
    func secondChoiceUpdate() {
        currentPlace + 2
    }
    
}

