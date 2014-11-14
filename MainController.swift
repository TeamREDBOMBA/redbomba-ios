//
//  TableViewController.swift
//  Redbomba
//
//  Created by JerryPark on 2014. 11. 13..
//  Copyright (c) 2014년 Redbomba. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tbTable: UITableView!
    var arrList:[elementList] = [elementList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setListData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setListData(){
        var jsp = JSONParser(query: "mode=getGlobalList&fid=0")
        for var i=0; i<jsp.jsonData.arrayValue?.count; i++ {
            arrList.append(elementList(
                src: jsp.jsonData[i]["img"].stringValue!,
                title:jsp.jsonData[i]["title"].stringValue!,
                txt:jsp.jsonData[i]["txt"].stringValue!,
                tag:"League of Legends",
                comments:jsp.jsonData[i]["comment_no"].stringValue!,
                date:jsp.jsonData[i]["date_updated"].stringValue!
                ))
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let mtc:MainTableCell = tableView.dequeueReusableCellWithIdentifier("MainTableCell") as MainTableCell
        
        if indexPath.row % 2 == 0{
            mtc.backgroundColor = UIColor.colorWithRGBHex(0xf7f7f7)
        }else{
            mtc.backgroundColor = UIColor.colorWithRGBHex(0xffffff)
        }
        
        let element = arrList[indexPath.row]
        mtc.setData(element)
        
        return mtc
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let element = arrList[indexPath.row]
        
        var detailController : DetailController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailController") as DetailController
        
        detailController.strSrc = element.strSrc
        detailController.strTitle = element.strTitle
        detailController.strTag = element.strTag
        detailController.strTxt = element.strTxt
        
        self.presentViewController(detailController, animated: true, completion: nil)
        self.tbTable.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    @IBAction func logOut(sender: AnyObject) {
        var refreshAlert = UIAlertController(title: "로그아웃", message: "정말로 로그아웃 하시겠습니까?", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "예", style: .Default, handler: { (action: UIAlertAction!) in
            UserDefault.delete("uid")
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "아니오", style: .Default, handler: { (action: UIAlertAction!) in
            
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
}

class elementList{
    
    var strSrc = ""
    var strTitle = ""
    var strTxt = ""
    var strTag = ""
    var strComments = ""
    var strDate = ""
    
    init(src:String, title:String, txt:String, tag:String, comments:String, date:String){
        self.strSrc = src
        self.strTitle = title
        self.strTxt = txt
        self.strTag = tag
        self.strComments = comments
        self.strDate = date
    }
}