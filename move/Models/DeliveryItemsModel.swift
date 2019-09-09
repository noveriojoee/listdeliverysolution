//
//  DeliveryItemsModel.swift
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

class DeliveryItemsModel: NSObject {
    var listOfDelivery : Array<DeliveryItemModel>?
    
    override init() {
        self.listOfDelivery = Array<DeliveryItemModel>()
    }
    
    func setListOfDelivery(arrayJson : [Any]){
        for item in arrayJson{
            self.listOfDelivery?.append(DeliveryItemModel(JSON: (item as! [String : Any]))!)
        }
    }
}
