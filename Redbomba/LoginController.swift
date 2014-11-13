//
//  ViewController.swift
//  Redbomba
//
//  Created by JerryPark on 2014. 10. 9..
//  Copyright (c) 2014년 Redbomba. All rights reserved.
//

import UIKit

class LoginController: UIViewController, NSURLConnectionDelegate {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPasswd: UITextField!
    
    lazy var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uid:String = UserDefault.load("uid")
        
        if uid != ""{
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("tryLogin"), userInfo: nil, repeats: false)
        }
        
    }
    
    @IBAction func tryLogin(sender: AnyObject) {
        var strEmail:String = tfEmail.text
        var strPasswd:String = tfPasswd.text
        
        if strEmail.isEmpty {
            UIcontents.showAlert("잘못된 이메일입니다.",strMsg: "이메일을 확인해주세요.")
        }else if strPasswd.isEmpty {
            UIcontents.showAlert("잘못된 패스워드입니다.",strMsg:"패스워드를 확인해주세요.")
        }else{
            var jsp = JSONParser(query: "mode=getLoginSession&email="+strEmail+"&password="+strPasswd)
            var userName = jsp.jsonData[0]["uid"]
            
            if let unwrapName = userName.stringValue {
                UserDefault.save("uid", value: unwrapName)
                var mainController:MainController = self.storyboard!.instantiateViewControllerWithIdentifier("MainController") as MainController
                self.presentViewController(mainController, animated: true, completion: nil)
            }else{
                UIcontents.showAlert("Fail",strMsg:"")
            }
        }
    }
    
    func tryLogin(){
        var mainController:MainController = self.storyboard!.instantiateViewControllerWithIdentifier("MainController") as MainController
        self.presentViewController(mainController, animated: true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}