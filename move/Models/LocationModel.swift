//
//  LocationModel.swift
//  move
//
//  Created by Noverio Joe on 07/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import ObjectMapper

class LocationModel: Mappable {
    var lat : String?
    var lng : String?
    var address : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
        address <- map["address"]
    }
}
