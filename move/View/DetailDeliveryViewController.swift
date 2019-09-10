//
//  DetailDeliveryViewController.swift
//  move
//
//  Created by Noverio Joe on 10/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import MapKit

class DetailDeliveryViewController: UIViewController {

    var viewModel : DetailDeliveryViewModel?
    @IBOutlet weak var detailMap: MKMapView!
    @IBOutlet weak var deliveryImage: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    var location : CLLocation?
    var regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.viewModel == nil){
            self.viewModel = DetailDeliveryViewModel()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (self.viewModel != nil){
            self.location = CLLocation(latitude: self.viewModel?.model?.location?.lat ?? 0, longitude: self.viewModel?.model?.location?.lng ?? 0)
            
            self.centerMapOnLocation(data: self.viewModel!.model!, location: self.location!)
            self.lblDescription.text = self.viewModel!.model!.descriptionStr! + " at " + self.viewModel!.model!.location!.address!
            self.deliveryImage.downloaded(from: self.viewModel!.model!.imageUrl!)
            
        }
    }
    
    func centerMapOnLocation(data : DeliveryItemModel,location: CLLocation) {
        let marker = LocationMarker(title: "Deliver To", locationName: data.location!.address!, coordinate: CLLocationCoordinate2D(latitude: data.location!.lat!, longitude: data.location!.lng!))
        let coordinateRegion = MKCoordinateRegion(center: self.location!.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.detailMap.setRegion(coordinateRegion, animated: true)
        self.detailMap.addAnnotation(marker)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
