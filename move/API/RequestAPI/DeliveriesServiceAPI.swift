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
    func getDeliveryItems(objectIndex index : Int, limit limitValue : Int,using networkObject: NetworkingObject!, getDeliveryCompleted: @escaping (APIResult<DeliveryItemsModel>)-> Void){
        let actionMethod = self.endpointUrl + "/deliveries?offset=" + String(index) + "&limit=" + String(limitValue) + ""
        let responseObject : APIResult<DeliveryItemsModel> = APIResult<DeliveryItemsModel>()
        let deliveryItems = DeliveryItemsModel()
        
        networkObject.performRequestGet(withAction: actionMethod, requestData: "") { (result) in
            if (result is [Any]){
                deliveryItems.setListOfDelivery(arrayJson: result as! [Any])
                responseObject.setResultObject(responseCode: "OK", responseMessage: "OK", data: deliveryItems)
            }else{
                responseObject.setResultObject(responseCode: "ERROR", responseMessage: "UNKNOWN ERROR", data: deliveryItems)
            }
            
            getDeliveryCompleted(responseObject)
        }
    }
}
