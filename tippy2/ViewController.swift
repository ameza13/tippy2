//
//  ViewController.swift
//  tippy2
//
//  Created by Adriana Meza on 4/4/20.
//  Copyright © 2020 Adriana Meza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        //1 Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //2 Calculate tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //3 Update tip and total
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }
    
    @IBAction func onTap(_ sender: Any) {
        print("user tap on main screen")
        view.endEditing(true)
        

    }
}

