//
//  ViewController.swift
//  Tips
//
//  Created by Yuting Zhang on 12/15/15.
//  Copyright © 2015 Yuting Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        var poorPercentage = 18
        var goodPercentage = 20
        var greatPercentage = 22
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.objectForKey("default_poor_percentage") != nil{
            poorPercentage = defaults.integerForKey("default_poor_percentage")
        }
        if defaults.objectForKey("default_good_percentage") != nil{
            goodPercentage = defaults.integerForKey("default_good_percentage")
        }
        if defaults.objectForKey("default_great_percentage") != nil{
            greatPercentage = defaults.integerForKey("default_great_percentage")
        }
        
        tipControl.setTitle(String(format: "%d%%", poorPercentage), forSegmentAtIndex: 0)
        tipControl.setTitle(String(format: "%d%%", goodPercentage), forSegmentAtIndex: 1)
        tipControl.setTitle(String(format: "%d%%", greatPercentage), forSegmentAtIndex:2)
        
        let tipPercentage = [Double(poorPercentage) / 100, Double(goodPercentage) / 100, Double(greatPercentage) / 100]
        
        let billAmount = NSString(string: billTextField.text!).doubleValue
        let tip = billAmount * tipPercentage[tipControl.selectedSegmentIndex]
        let total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var poorPercentage = 18
        var goodPercentage = 20
        var greatPercentage = 22
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.objectForKey("default_poor_percentage") != nil{
            poorPercentage = defaults.integerForKey("default_poor_percentage")
        }
        if defaults.objectForKey("default_good_percentage") != nil{
            goodPercentage = defaults.integerForKey("default_good_percentage")
        }
        if defaults.objectForKey("default_great_percentage") != nil{
            greatPercentage = defaults.integerForKey("default_great_percentage")
        }
        
        let tipPercentage = [Double(poorPercentage) / 100, Double(goodPercentage) / 100, Double(greatPercentage) / 100]
        
        let billAmount = NSString(string: billTextField.text!).doubleValue
        let tip = billAmount * tipPercentage[tipControl.selectedSegmentIndex]
        let total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
