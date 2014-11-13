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
}