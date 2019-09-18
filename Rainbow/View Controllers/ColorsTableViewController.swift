//
//  ColorsTableViewController.swift
//  Rainbow
//
//  Created by Christian Lorenzo on 9/17/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit   //Framework that allows us to build UIs

class ColorsTableViewController: UITableViewController {
    
    var colors: [Color] = [
        Color(name: "Red", color: UIColor.red),
        Color(name: "Orange", color: UIColor.orange),
        Color(name: "Yellow", color: UIColor.yellow),
        Color(name: "Green", color: UIColor.green),
        Color(name: "Blue", color: UIColor.blue),
        Color(name: "Cyan", color: UIColor.cyan),
        Color(name: "Purple", color: UIColor.purple)
    ]
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name
        return cell
    }
    
    //Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowColorSegue" {
            guard let detailVC = segue.destination as? ColorDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let color = colors[indexPath.row]
            
            detailVC.cellColor = color
        }
    }
    
}


