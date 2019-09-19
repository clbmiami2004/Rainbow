//
//  ColorsDetailViewController.swift
//  Rainbow
//
//  Created by Christian Lorenzo on 9/17/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

//This screen is used to show the name of the color being shown and the Actual Color as the background.

class ColorDetailViewController: UIViewController {
    
    var cellColor: Color?  // This need to place this variable everytime we want to show a different color.
    
    
    //Preparing the screen to show the information being sent.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    //Making sure that color exists. UNwrapping the color to check.
    func updateViews() {
        
        guard let cellColor = cellColor else {return}
        
        title = cellColor.name
        view.backgroundColor = cellColor.color  //This is to show the background color on the screen.
    }
    
}
