//
//  DeliveryItemModel.swift
//  move
//
//  Created by Noverio Joe on 07/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import ObjectMapper

public class DeliveryItemModel: Mappable {
    
    public var id : String?
    public var descriptionStr : String?
    public var imageUrl : String?
    public var location : LocationModel?
    
    public required init?(map: Map) {
        
    }
    public func mapping(map: Map) {
        id <- map["id"]
        descriptionStr <- map["description"]
        imageUrl <- map["imageUrl"]
        location <- map["location"]
    }
 
}
