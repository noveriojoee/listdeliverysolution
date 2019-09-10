//
//  LocationMarker.swift
//  move
//
//  Created by Noverio Joe on 10/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import MapKit

class LocationMarker: NSObject, MKAnnotation {

    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
