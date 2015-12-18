//
//  TipsUtilities.swift
//  Tips
//
//  Created by Yuting Zhang on 12/17/15.
//  Copyright © 2015 Yuting Zhang. All rights reserved.
//

import Foundation

func loadDefaultSettings() -> (Int, Int, Int){
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
    
    return (poorPercentage, goodPercentage, greatPercentage)
}