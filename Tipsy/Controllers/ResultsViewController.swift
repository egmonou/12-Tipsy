//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by administrator on 18/04/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var totalRecieve: String?
    var peopleReceive: Int?
    var tipReceive: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalRecieve
        settingsLabel.text = ("Split between \(peopleReceive ?? 0) people, with \(tipReceive ?? 0)% tip")
        
    }
    

    @IBAction func Recalulate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
   
}
