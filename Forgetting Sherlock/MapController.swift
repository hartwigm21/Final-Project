//
//  MapController.swift
//  Forgetting Sherlock
//
//  Created by Matthew Hartwig on 10/10/15.
//  Copyright © 2015 Matthew Hartwig. All rights reserved.
//

import UIKit
import SpriteKit

class MapController: UIViewController {

    @IBOutlet weak var MapImage: UIImageView!
    @IBAction func backButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MapScene(fileNamed: "MapScene")
         let skView = self.view as! SKView
         skView.presentScene(scene)
        

        /*let bgImage = UIImageView()
        bgImage.image = UIImage(named: "Vintage")
        self.view = bgImage*/
        
        }
    }
    

