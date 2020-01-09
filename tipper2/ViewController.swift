//
//  ViewController.swift
//  tipper2
//
//  Created by Timothy Cheung on 12/27/19.
//  Copyright © 2019 timothycheung-codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    //@IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    //@IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.text = "$0.00"
        let defaults = UserDefaults.standard
        /*billField.text = String(defaults.double(forKey: "currentBill"))
        calculateTip(1)
        let other = defaults.object(forKey: "time") ?? NSDate.init()
        let start = NSDate.init()
        let interv = start.timeIntervalSince(other as! Date)
        defaults.set(start, forKey: "time")
        print(interv)
        timeLabel.text = String(interv)
        */
        let other = defaults.object(forKey: "time") ?? NSDate.init()
        let start = NSDate.init()
        let interv = start.timeIntervalSince(other as! Date)
        if interv < 3600{
            billField.text = String(defaults.double(forKey: "currentBill"))
            calculateTip(1)
        }else{
            defaults.set(0.0, forKey: "currentBill")
        }
        defaults.set(start, forKey: "time")
        //print(start.description)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let temp = defaults.double(forKey: "percent")
        if temp == 0.15{
            tipControl.selectedSegmentIndex = 0
        } else if temp == 0.18{
            tipControl.selectedSegmentIndex = 1
        } else{
            tipControl.selectedSegmentIndex = 2
        }
        let colorMode = defaults.bool(forKey: "darkPref")
        if colorMode{
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }


    @IBAction func onTap(_ sender: Any) {
        //print("Hello")
        view.endEditing(true)
    }

    
    @IBAction func calculateTip(_ sender: Any) {
        // Fields and labels are always strings
        // Use <name.text> to access/change the label variable
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0.0
        // if the stuff to the left of the ?? is not valid, then put 0
        // the exclamation mark is needed --> reason unknown
        
        // Calculate the tip and the total
        let tipPercentages = [0.15,0.18,0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        // Update the tip and total labels
        // the notaton: "$\(varName)" lets you format a variable in the place of the \(...)
        tipLabel.text = String(format: "$%.2f", tip)
        // %f means that the variable to format at that spot is a double/ decimal number; %d for integer; %@ for string
        totalLabel.text = String(format: "$%.2f", total)
        // %.2f: the .2 part means that therthe number should go to two decimal places
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "currentBill")
        
    }
}

