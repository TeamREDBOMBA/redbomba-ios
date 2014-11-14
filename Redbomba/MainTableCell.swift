//
//  MainTableCellViewTableViewCell.swift
//  Redbomba
//
//  Created by JerryPark on 2014. 11. 13..
//  Copyright (c) 2014년 Redbomba. All rights reserved.
//

import UIKit

class MainTableCell: UITableViewCell {

    @IBOutlet weak var imgSrc: UIImageView!
    @IBOutlet weak var tvTitle: UITextView!
    @IBOutlet weak var lbTag: UILabel!
    @IBOutlet weak var lbComments: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(ele:elementList){
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            self.imgSrc.contentMode = .ScaleAspectFit
            self.imgSrc.image =  UIImage(data: NSData(contentsOfURL: NSURL(string:"http://redbomba.net\(ele.strSrc)")!)!)
        })
        
        self.tvTitle.text = ele.strTitle
        self.tvTitle.font = UIFont(name: "Helvetica", size: 20)
        
        self.lbTag.text = ele.strTag
        self.lbComments.text = ele.strComments
        self.lbDate.text = ele.strDate
    }

}
