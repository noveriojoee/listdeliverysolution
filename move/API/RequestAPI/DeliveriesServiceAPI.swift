//
//  DeliveriesServiceAPI.swift
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import ObjectMapper

public class DeliveriesServiceAPI: BaseAPIRequest {
    func getDeliveryItems(using networkObject: NetworkingObject!, getDeliveryCompleted: @escaping (APIResult<DeliveryItemsModel>)-> Void){
        let actionMethod = self.endpointUrl + "/deliveries"
        let responseObject : APIResult<DeliveryItemsModel> = APIResult<DeliveryItemsModel>()
        let deliveryItems = DeliveryItemsModel()
        
        networkObject.performRequestGet(withAction: actionMethod, requestData: "") { (result) in
            if (result is [Any]){
                for item in (result as! [Any]){
                    deliveryItems.listOfDelivery?.append(DeliveryItemModel(JSON: (item as! [String : Any]))!)
                }
                responseObject.setResultObject(responseCode: "OK", responseMessage: "OK", data: deliveryItems)
            }else{
                responseObject.setResultObject(responseCode: "ERROR", responseMessage: "UNKNOWN ERROR", data: deliveryItems)
            }
            
            getDeliveryCompleted(responseObject)
        }
    }
}
