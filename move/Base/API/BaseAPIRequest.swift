//
//  BaseAPIRequest.swift
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

public class BaseAPIRequest: NSObject {
    var endpointUrl : String!
    var networkingObject : NetworkingObject?;
    
    
    public override init() {
        self.endpointUrl = "https://mock-api-mobile.dev.lalamove.com"
    }

}
