    //
//  StoryViewController.swift
//  Forgetting Sherlock
//
//  Created by Matthew Hartwig on 10/7/15.
//  Copyright © 2015 Matthew Hartwig. All rights reserved.
//

import UIKit

protocol StoryViewControllerDelegate {
    func displayText(text: String)
}

class StoryViewController: UITableViewController {
    
    
    var bgImage: UIImageView!
    private var count:Int = 0
    
    private var storyTracker = StoryTracker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.rowHeight = 75.00
        
        bgImage = UIImageView()
        bgImage.image = UIImage(named: "newBackgroundImage")
        self.tableView.backgroundView = bgImage
        
        let button   = UIButton(type: UIButtonType.Custom)       //set image for button
        button.frame = CGRectMake(100, 100, 100, 100)
        button.sizeToFit()
        button.setImage(UIImage(named: "mapimage"), forState: UIControlState.Normal)
        let barButton = UIBarButtonItem(customView: button)
        button.addTarget(self, action: "btnTouched", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = barButton
        
        
        let buttonNews   = UIButton(type: UIButtonType.Custom)       //set image for button
        buttonNews.frame = CGRectMake(100, 100, 100, 100)
        buttonNews.sizeToFit()
        buttonNews.setImage(UIImage(named: "news"), forState: UIControlState.Normal)
        let barButtonNews = UIBarButtonItem(customView: buttonNews)
        buttonNews.addTarget(self, action: "newsButtonTouched", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.rightBarButtonItem = barButtonNews
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "choiceRefresh", name: "received", object: nil)


        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func choiceRefresh() {
        print("heard")
        count = 0
        self.tableView.reloadData()
        
            let lastRowNumber = tableView.numberOfRowsInSection(0) - 1
            let indexPath = NSIndexPath(forRow: lastRowNumber, inSection: tableView.numberOfSections - 1)
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
 }
    
    func btnTouched() {
        performSegueWithIdentifier("mySegue", sender: self)
    }
    
    func newsButtonTouched() {
        performSegueWithIdentifier("newsSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return storyTracker.numSectionsAccessor
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("section is \(section)")
        return storyTracker.numRowsAccessor[section]
        
    }

    
    //Use remainder to find if even or odd, then choose text or choice based on that
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section % 2 == 0 {
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath)
            //TextCell.displayText("Hello")
            cell.backgroundView?.alpha = 0.0
            cell.backgroundColor = UIColor.clearColor()
            
            (cell as! TextCell).storyText.text = storyTracker.dict[count]!.title
            return cell
        } else {
        let cell = tableView.dequeueReusableCellWithIdentifier("choiceCell", forIndexPath: indexPath)
            cell.backgroundColor = UIColor.clearColor()
            (cell as! ChoiceCell).tracker = storyTracker
            
                            // choiceOne.setTitle(storyTracker.dict[count]!.title, forState: .Normal)
            count++

            (cell as! ChoiceCell).choiceOne.setTitle(storyTracker.dict[count]!.title, forState: .Normal)
            (cell as! ChoiceCell).choiceTwo.setTitle(storyTracker.dict[count]!.subtitle, forState: .Normal)
            count++
            return cell
        }
        // Configure the cell...
    }
    
    
    
    
   
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
