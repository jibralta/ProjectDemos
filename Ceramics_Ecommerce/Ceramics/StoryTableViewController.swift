//
//  StoryTableViewController.swift
//  Ceramics
//
//  Created by Joy Umali on 4/3/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class StoryTableViewController: UITableViewController {

    var stories = ["Modern","Rustic", "Old"]
    // modern, rustic, etc.
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as? StoryTableViewCell

        cell?.storyName.text = stories[indexPath.row]
        
        return cell!
    }



    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        
        performSegue(withIdentifier: "StoryToListSegue", sender: self)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProductListPerStoryTVC {
            if let selectedIndexPath = selectedIndexPath {
                
                destination.storyName = stories[selectedIndexPath.row]
            }
            
        }
        
        
    }


}
