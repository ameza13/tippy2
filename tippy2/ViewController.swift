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
        print("View Did Load")
        
        //Navigaiton Bar style
        /*navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.orange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ArialHebrew-Light", size: 20)!]*/
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        setUpTipControl()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    func setUpTipControl(){
        let defaults = UserDefaults.standard
        var defaultPer = 0
        
        if isKeyPresentInUserDefaults(key: "defaultPercentage"){
            defaultPer = defaults.integer(forKey: "defaultPercentage")
        }
        print(defaultPer)
        tipControl.selectedSegmentIndex = defaultPer
        
        //Segmented Control style
        //tipControl.backgroundColor = .darkGray
        tipControl.selectedSegmentTintColor = .white
        tipControl.layer.cornerRadius = 0
        tipControl.layer.borderWidth = 0
        tipControl.layer.masksToBounds = true
        tipControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)], for: .selected)
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: "defaultPercentage") != nil
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

