//
//  ViewController.swift
//  Checklist
//
//  Created by ios on 22/10/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // set the number of rows to 1000
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            if indexPath.row % 5 == 0 {
                label.text = "Take a jog"
            } else if indexPath.row % 5 == 1 {
                label.text  = "Watch a movie" 
            } else if indexPath.row % 5 == 2 {
                label.text = "Code an app"
            } else if indexPath.row % 5 == 3 {
                label.text = "Walk the dog"
            } else {
                label.text = "Study Design Patterns"
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

