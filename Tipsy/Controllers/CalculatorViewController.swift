//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextFeild: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercentage = 0.10
    var persons = 2.0
    var calc = 0.0
    var splitSender = "0.0"
     
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPcButton.isSelected = false
        
        sender.isSelected = true
        
        let selectedValue = sender.currentTitle!
        let removePercentageSign = String(selectedValue.dropLast())
        tipPercentage = Double(removePercentageSign)! / 100
        billTextFeild.endEditing(true)

    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%0.0f", sender.value)
        persons = sender.value
    
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let input = billTextFeild.text!
        if input != "" {
            calc = Double(input)!
            let split = calc * (1 + tipPercentage) / persons
            splitSender = String(format: "%.2f", split)
        }

        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destenationVC = segue.destination as! ResultsViewController
        if segue.identifier == "goToResult" {
            destenationVC.totalRecieve = splitSender
            destenationVC.peopleReceive = Int(persons)
            destenationVC.tipReceive = Int(tipPercentage * 100)
        }
    }
    
    
    
}

