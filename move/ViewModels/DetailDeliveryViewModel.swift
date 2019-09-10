//
//  DetailDeliveryViewModel.swift
//  move
//
//  Created by Noverio Joe on 10/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

class DetailDeliveryViewModel: NSObject {
    private var networkObj : NetworkingObject!
    
    var model : DeliveryItemModel?
    
    public override init() {
        self.networkObj = NetworkingObject.sharedManager()
    }
}
