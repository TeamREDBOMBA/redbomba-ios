//
//  ViewController.swift
//  Redbomba
//
//  Created by JerryPark on 2014. 10. 9..
//  Copyright (c) 2014년 Redbomba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://redbomba.net/")
        let request = NSURLRequest(URL: url)
        webview.loadRequest(request)
    }
    
    @IBAction func doRefresh(AnyObject) {
        webview.reload()
    }
    
    @IBAction func goBack(AnyObject) {
        webview.goBack()
    }
    
    @IBAction func goForward(AnyObject) {
        webview.goForward()
    }
    
    @IBAction func stop(AnyObject) {
        webview.stopLoading()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

