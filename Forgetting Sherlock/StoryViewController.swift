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


        

        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath)
            //TextCell.displayText("Hello")
            cell.backgroundView?.alpha = 0.0
            cell.backgroundColor = UIColor.clearColor()
            return cell
        } else {
        let cell = tableView.dequeueReusableCellWithIdentifier("choiceCell", forIndexPath: indexPath)
            cell.backgroundColor = UIColor.clearColor()
            return cell
        }
        // Configure the cell...
    }
    
   
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
