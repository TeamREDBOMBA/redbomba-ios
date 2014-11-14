//
//  JSONPaserController.swift
//  Redbomba
//
//  Created by JerryPark on 2014. 11. 12..
//  Copyright (c) 2014년 Redbomba. All rights reserved.
//

import UIKit
import Foundation

class JSONParser {
    
    let jsonData:JSON
    
    init(query: String) {
        var mobileUrl = "http://redbomba.net/mobile/?"+query;
        jsonData = JSON(data: NSData(contentsOfURL: NSURL(string: mobileUrl)!)!)
    }
}

class UIcontents {
    class func showAlert(strTitle:String, strMsg:String){
        let alert = UIAlertView()
        alert.title = strTitle
        alert.message = strMsg
        alert.addButtonWithTitle("확인")
        alert.show()
    }
}

class UserDefault{
    class func save(key:String, value:String){
        var userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(value, forKey: key)
        userDefaults.synchronize()
    }
    
    class func load(key:String) -> String {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let value = userDefaults.valueForKey(key) as? String {
            return value
        } else {
            return ""
        }
    }
    
    class func delete(key:String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey(key)
    }
}

extension UIColor {
    class func colorWithRGBHex(hex: Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF)
        let g = Float((hex >> 8) & 0xFF)
        let b = Float((hex) & 0xFF)
        
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue:CGFloat(b / 255.0), alpha: CGFloat(alpha))
    }
}