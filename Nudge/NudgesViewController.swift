//
//  NudgesViewController.swift
//  Nudge
//
//  Created by David Taylor on 9/6/16.
//  Copyright © 2016 Hyper Elephant. All rights reserved.
//


//Main View Controller of the app. I included a tableview and wrapped it in a navigation controller to get you started.
// I implemented the UITableViewDelegate and UITableViewDatasource so you can get going quickly. You'll have to add some boilerplate to cellForRowAtIndexPath,
// but I thought that might be a good excersize.
import UIKit

class NudgesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nudgeTableView: UITableView!
    let reuseIdentifier = "cell"
    let addNudgeSegueIdentifier = "addNudgeSegue"
    
    var nudges = [Nudge]()
    var nudgeToEditIndex: Int?
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nudgeTableView.dataSource = self
        nudgeTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("Num nudges: ", nudges.count)
        return nudges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = nudges[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nudgeToEditIndex = indexPath.row
        performSegueWithIdentifier(addNudgeSegueIdentifier, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == addNudgeSegueIdentifier {
            let destination = segue.destinationViewController as! AddNudgeViewController
            if nudgeToEditIndex != nil {
                if nudgeToEditIndex < nudges.count {
                    let nudge = nudges[nudgeToEditIndex!]
                    destination.newNudge = nudge
                    destination.nudgeIndex = nudgeToEditIndex
                }
            }
        }
        nudgeToEditIndex = nil
    }


}

