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
    
    private var offset : Int
    private var limit : Int
    
    var dataPage : Int
    var deliveryItemModels : Array<DeliveryItemModel>?
    var count : Int
    
    public override init() {
        
        self.deliveryServices = DeliveriesServiceAPI()
        self.networkObj = NetworkingObject.sharedManager()
        self.deliveryItemModels = Array<DeliveryItemModel>()
        self.count = 0
        self.offset = 0
        self.limit = 15
        self.dataPage = 0
        
    }
    
    public func setTblViewPage(pageNumber number : Int){
        self.dataPage = number
        self.offset = (self.limit * number)
    }
    
    public func loadDataDeliveryItems(onCompleted: @escaping (String)-> Void){
        self.deliveryServices.getDeliveryItems(objectIndex: self.offset, limit: self.limit, using: self.networkObj) { (serviceResult) in
            if (serviceResult.responseCode == "OK"){
                //Sorting array in swift
                let listResult = serviceResult.getResultObject().listOfDelivery?.sorted(by: { (id1, id2) -> Bool in
                    return id1.deliveryItemId! < id2.deliveryItemId!
                })
                //END
                
                for item in listResult!{
                    self.deliveryItemModels?.append(item)
                }
                
                self.count = self.deliveryItemModels?.count ?? 0
                onCompleted(serviceResult.responseCode!)
            }else{
                onCompleted(serviceResult.responseMessage!)
            }
        }
    }
    
}
