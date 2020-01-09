//
//  SettingsViewController.swift
//  tipper2
//
//  Created by Timothy Cheung on 1/5/20.
//  Copyright © 2020 timothycheung-codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorModeControl: UISegmentedControl!
    @IBOutlet weak var defaultControls: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        /*if defaultControls.selectedSegmentIndex == 0{
            defaults.set(0.15, forKey: "15%")
        } else if defaultControls.selectedSegmentIndex == 1{
            defaults.set(0.18, forKey: "18%")
        } else if defaultControls.selectedSegmentIndex == 2{
            defaults.set(0.2, forKey: "20%")
        }*/
        /*
        defaults.set(0.15, forKey: "15%")
        defaults.set(0.18, forKey: "18%")
        defaults.set(0.2, forKey: "20%")*/
        if defaultControls.selectedSegmentIndex == 0{
            defaults.set(0.15, forKey: "percent")
        } else if defaultControls.selectedSegmentIndex == 1{
            defaults.set(0.18, forKey: "percent")
        } else if defaultControls.selectedSegmentIndex == 2{
            defaults.set(0.2, forKey: "percent")
        }
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let temp = defaults.double(forKey: "percent")
        if temp == 0.15{
            defaultControls.selectedSegmentIndex = 0
        } else if temp == 0.18{
            defaultControls.selectedSegmentIndex = 1
        } else{
            defaultControls.selectedSegmentIndex = 2
        }
        let colorMode = defaults.bool(forKey: "darkPref")
        if colorMode{
            overrideUserInterfaceStyle = .dark
            colorModeControl.selectedSegmentIndex = 1
        }else{
            overrideUserInterfaceStyle = .light
            colorModeControl.selectedSegmentIndex = 0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("edu")
    }
    
    
    @IBAction func changeColorMode(_ sender: Any) {
        let defaults = UserDefaults.standard
        if colorModeControl.selectedSegmentIndex == 0{
            overrideUserInterfaceStyle = .light
            defaults.set(false, forKey: "darkPref")
        }else{
            overrideUserInterfaceStyle = .dark
            defaults.set(true, forKey: "darkPref")
        }
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
