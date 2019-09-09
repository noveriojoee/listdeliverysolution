//
//  DeliveriesServiceAPI.swift
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

public class DeliveriesServiceAPI: BaseAPIRequest {
    func getDeliveryItems(using networkObject: NetworkingObject!, getDeliveryCompleted: @escaping (DeliveryItemModel)-> Void){
        let actionMethod = self.endpointUrl + "/deliveries"
        
        networkObject.performRequestGet(withAction: actionMethod, requestData:"") { (result) in
            let responseObject = DeliveryItemModel(JSON: (result as! [String : Any]))
            getDeliveryCompleted(responseObject!)
        };
    }
}
