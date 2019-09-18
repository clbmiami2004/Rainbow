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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        
        guard let cellColor = cellColor else {return}
        
        title = cellColor.name
        view.backgroundColor = cellColor.color
    }
    
}
