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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let editNudge = newNudge {
            //If AddNudge is given an existing nudge before loading, the nudge is being edited
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
}
