//
//  DetailController.swift
//  Redbomba
//
//  Created by JerryPark on 2014. 11. 13..
//  Copyright (c) 2014년 Redbomba. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    
    @IBOutlet weak var ivSrc: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTag: UILabel!
    @IBOutlet weak var tvTxt: UITextView!
    
    var strSrc:String = ""
    var strTitle:String = ""
    var strTag:String = ""
    var strTxt:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            self.ivSrc.contentMode = .ScaleAspectFit
            self.ivSrc.image =  UIImage(data: NSData(contentsOfURL: NSURL(string:"http://redbomba.net\(self.strSrc)")!)!)
        })
        
        self.lbTitle.text = self.strTitle
        self.lbTag.text = self.strTag
        
        self.tvTxt.text = self.strTxt
        self.tvTxt.font = UIFont(name: "Helvetica", size: 20)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
