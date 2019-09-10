//
//  CustomTableViewCell.swift
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var model : DeliveryItemModel?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func renderTableViewCell(with data : DeliveryItemModel!){
        self.model = data
        self.imgView.downloaded(from: data.imageUrl!)
        self.lblDescription.text = data.descriptionStr! + " at " + data.location!.address!
    }
}
