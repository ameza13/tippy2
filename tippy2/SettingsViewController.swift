//
//  SettingsViewController.swift
//  tippy2
//
//  Created by Adriana Meza on 4/4/20.
//  Copyright © 2020 Adriana Meza. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var saveSettings: UIButton!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*navigationController?.navigationBar.prefersLargeTitles = true*/
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        setUpTipControl()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        //Updaet defaults
        let defaultPer = tipControl.selectedSegmentIndex
        defaults.set(defaultPer, forKey: "defaultPercentage")
        defaults.synchronize()
        print("default tipControl value changed to:")
        print(defaultPer)
    }
    func setUpTipControl(){
        let defaults = UserDefaults.standard
        var defaultPer = 0
        
        if isKeyPresentInUserDefaults(key: "defaultPercentage"){
            defaultPer = defaults.integer(forKey: "defaultPercentage")
        }
        print(defaultPer)
        tipControl.selectedSegmentIndex = defaultPer
    }
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: "defaultPercentage") != nil
    }
    func updateTipControl(){
        let defaultPer = tipControl.selectedSegmentIndex
        defaults.set(defaultPer, forKey: "defaultPercentage")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
