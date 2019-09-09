//
//  DeliveriesInquiryViewModel.swift
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

public class DeliveriesInquiryViewModel: NSObject {
    private var deliveryServices : DeliveriesServiceAPI!
    private var networkObj : NetworkingObject!
    private var deliveryItemModels : DeliveryItemsModel?
    
    public override init() {
        self.deliveryServices = DeliveriesServiceAPI()
        self.networkObj = NetworkingObject.sharedManager()
    }
    
    public func loadDataDeliveryItems(onCompleted: @escaping (String)-> Void){
        self.deliveryServices.getDeliveryItems(using: self.networkObj) { (serviceResult) in
            if (serviceResult.responseCode == "OK"){
                self.deliveryItemModels = serviceResult.JSONObject
                onCompleted(serviceResult.responseCode!)
            }else{
                onCompleted(serviceResult.responseMessage!)
            }
        }
    }
    
}
