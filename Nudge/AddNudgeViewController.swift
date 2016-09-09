//
//  AddNudgeViewController.swift
//  Nudge
//
//  Created by David Taylor on 9/6/16.
//  Copyright © 2016 Hyper Elephant. All rights reserved.
//

import UIKit

class AddNudgeViewController: UIViewController {
    
    var newNudge: Nudge?
    var userIsEditing = false
    var nudgeIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let editNudge = newNudge {
            userIsEditing = true
            nameField.text = editNudge.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        newNudge = Nudge(name: nameField.text!)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //print("Preparing for segue")
        let destination = segue.destinationViewController as! NudgesViewController
        if let nudge = newNudge {
            if userIsEditing {
                destination.nudges[nudgeIndex!] = nudge
            } else {
                destination.nudges.append(nudge)
                //print("Nudge added")
            }
        }
        destination.nudgeToEditIndex = nil
        destination.nudgeTableView.reloadData()
    }
 

}
