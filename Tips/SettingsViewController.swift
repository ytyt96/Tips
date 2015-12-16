//
//  SettingsViewController.swift
//  Tips
//
//  Created by Yuting Zhang on 12/15/15.
//  Copyright © 2015 Yuting Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var PoorServiceSlider: UISlider!
    @IBOutlet weak var GoodServiceSlider: UISlider!
    @IBOutlet weak var GreatServiceSlider: UISlider!
    @IBOutlet weak var PoorServiceLabel: UILabel!
    @IBOutlet weak var GoodServiceLabel: UILabel!
    @IBOutlet weak var GreatServiceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
        
        PoorServiceSlider.setValue(Float(poorPercentage) / 100, animated: true)
        PoorServiceLabel.text = String(format: "%d%%", poorPercentage)
        
        GoodServiceSlider.setValue(Float(goodPercentage) / 100, animated: true)
        GoodServiceLabel.text = String(format: "%d%%", goodPercentage)

        GreatServiceSlider.setValue(Float(greatPercentage) / 100, animated: true)
        GreatServiceLabel.text = String(format: "%d%%", greatPercentage)
        
    }
    
    
    @IBAction func PoorServiceSliderChanged(sender: AnyObject) {
        PoorServiceLabel.text = String(format: "%d%%", Int(100 * PoorServiceSlider.value))
        let poorPercentage = Int(PoorServiceSlider.value * 100)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(poorPercentage, forKey: "default_poor_percentage")
        defaults.synchronize()

    }

    @IBAction func GoodServiceSliderChanged(sender: AnyObject) {
        GoodServiceLabel.text = String(format: "%d%%", Int(100 * GoodServiceSlider.value))
        let goodPercentage = Int(GoodServiceSlider.value * 100)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(goodPercentage, forKey: "default_good_percentage")
        defaults.synchronize()
    }
    
    @IBAction func GreatServiceSliderChanged(sender: AnyObject) {
        GreatServiceLabel.text = String(format: "%d%%", Int(100 * GreatServiceSlider.value))
        let greatPercentage = Int(GreatServiceSlider.value * 100)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(greatPercentage, forKey: "default_great_percentage")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
