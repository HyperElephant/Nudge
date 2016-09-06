//
//  ViewController.swift
//  Nudge
//
//  Created by David Taylor on 9/6/16.
//  Copyright © 2016 Hyper Elephant. All rights reserved.
//


//Main View Controller of the app. I included a tableview and wrapped it in a navigation controller to get you started.
// I implemented the UITableViewDelegate and UITableViewDatasource so you can get going quickly. You'll have to add some boilerplate to cellForRowAtIndexPath,
// but I thought that might be a good excersize.
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nudgeTableView: UITableView!
    let reuseIdentifier = "cell"
    
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }


}

