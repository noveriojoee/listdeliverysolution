//
//  DeliveryItemModel.swift
//  move
//
//  Created by Noverio Joe on 07/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import ObjectMapper

class DeliveryItemModel: Mappable {
    
    var id : String?
    var descriptionStr : String?
    var imageUrl : String?
    var location : LocationModel?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        descriptionStr <- map["description"]
        imageUrl <- map["imageUrl"]
        location <- map["location"]
    }
 
}
