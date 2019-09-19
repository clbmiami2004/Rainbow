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
    
    
    @IBAction func addNewColor(_ sender: Any) {
        let alert = UIAlertController(title: "Add Color", message: "Specify a color to add, values should be from 0-255.", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Color Name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Red (0-255)"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Green (0-255)"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Blue (0-255)"
        }
        
        
        //Alert controller and added all the fields to it.
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (_) in
            guard let name = alert.textFields?[0].text, !name.isEmpty else {return}
            
            guard let redString = alert.textFields?[1].text, let redValue = Double(redString) else {return}
            
            guard let greenString = alert.textFields?[2].text, let greenValue = Double(greenString) else {return}
            
            guard let blueString = alert.textFields?[3].text, let blueValue = Double(blueString) else {return}
            
            let color = Color(name: name, color: UIColor(red: CGFloat(redValue/255), green: CGFloat(greenValue/255), blue: CGFloat(blueValue/255), alpha: 1.0))
            
            self.colors.append(color) //Adding new colors to the array.
            self.tableView.reloadData() // Reloading to show new colors.
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    
}


