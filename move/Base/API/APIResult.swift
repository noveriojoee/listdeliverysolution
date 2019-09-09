//
//  APIResult.swift
//  move
//
//  Created by Noverio Joe on 09/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

protocol APIResultProtocol
{
    associatedtype JSON
    func setResultObject(responseCode : String, responseMessage : String ,data: JSON)
    func getResultObject() -> JSON
}

class APIResult<JSON>: APIResultProtocol {
    var responseCode : String?
    var responseMessage : String?
    var JSONObject : JSON?

    func setResultObject(responseCode : String, responseMessage : String ,data: JSON){
        self.responseCode = responseCode
        self.responseMessage = responseMessage;
        self.JSONObject = data
    }
    
    func getResultObject() -> JSON{
        return self.JSONObject!
    }
}
