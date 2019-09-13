//
//  DeliveryItemTableViewCell.swift
//  move
//
//  Created by Noverio Joe on 13/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

class DeliveryItemTableViewCell: UITableViewCell {
    
    var model : DeliveryItemModel?
    var imgView: UIImageView!
    var lblDescription: UILabel!
    var view : UIView!
    var isRendered : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func drawUI(){
        if (!self.isRendered){
            self.view = self.contentView
            self.imgView = UIImageView(frame: CGRect(x: 5, y: 0, width: 60, height: 60))
            self.lblDescription = UILabel(frame: CGRect(x: self.imgView.frame.width + 20, y: 0, width: self.view.frame.width - self.imgView.frame.width - 5, height: self.view.frame.height - 5))
            self.lblDescription.numberOfLines = 0
            self.view.addSubview(self.imgView)
            self.view.addSubview(self.lblDescription)
            self.isRendered = true
        }
        
    }
    
    func renderTableViewCell(with data : DeliveryItemModel!){
        self.drawUI()
        self.model = data
        self.imgView.downloaded(from: data.imageUrl!)
        self.lblDescription.text = data.descriptionStr! + " at " + data.location!.address!
    }
    
}
