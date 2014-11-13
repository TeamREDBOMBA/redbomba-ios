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
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var bottomSize: NSLayoutConstraint!
    
    lazy var data = NSMutableData()
    var uid:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfEmail.attributedPlaceholder = NSAttributedString(string:"이메일", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        tfPasswd.attributedPlaceholder = NSAttributedString(string:"비밀번호", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
    }
    
    override func viewDidAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        self.uid = UserDefault.load("uid")
        if self.uid != ""{
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.0, target: self, selector: Selector("tryLogin"), userInfo: nil, repeats: false)
        }else{
            tfEmail.text = ""
            tfPasswd.text = ""
            viewLogin.hidden = false
        }
    }
    
    @IBAction func tryLogin(sender: AnyObject) {
        var strEmail:String = tfEmail.text
        var strPasswd:String = tfPasswd.text
        
        if strEmail.isEmpty {
            UIcontents.showAlert("잘못된 이메일입니다.",strMsg: "이메일을 확인해주세요.")
        }else if strPasswd.isEmpty {
            UIcontents.showAlert("잘못된 비밀번호입니다.",strMsg:"비밀번호를 확인해주세요.")
        }else{
            var jsp = JSONParser(query: "mode=getLoginSession&email="+strEmail+"&password="+strPasswd)
            var userName = jsp.jsonData[0]["uid"]
            
            if let unwrapName = userName.stringValue {
                UserDefault.save("uid", value: unwrapName)
                var mainController:MainController = self.storyboard!.instantiateViewControllerWithIdentifier("MainController") as MainController
                self.presentViewController(mainController, animated: true, completion: nil)
            }else{
                UIcontents.showAlert("로그인 실패",strMsg:"이메일 및 비밀번호를 확인해주세요.")
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
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    func keyboardWillShow(sender: NSNotification) {
        var keyboardSize = (sender.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().height
        
        var keyboardH = keyboardSize!
        
        bottomSize.constant = keyboardH/3
    }
    
    func keyboardWillHide(sender: NSNotification) {
        bottomSize.constant = 0
    }
}