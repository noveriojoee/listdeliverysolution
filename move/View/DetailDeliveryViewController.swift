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
    var detailMap: MKMapView!
    var detailView : UIView!
    var deliveryImage: UIImageView!
    var lblDescription: UILabel!
    
    var location : CLLocation?
    var regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawUI()
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
    
    func drawUI(){
        self.view.backgroundColor = UIColor.white
        self.detailMap = MKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 250))
        self.detailView = UIView(frame: CGRect(x: 0, y: self.detailMap.frame.height + 5, width: self.view.frame.width, height: 60))
        self.deliveryImage = UIImageView(frame: CGRect(x: 5, y: self.detailView.frame.height / 2, width: 60, height: 60))
        self.lblDescription = UILabel(frame: CGRect(x: self.deliveryImage.frame.width + 5, y: self.detailView.frame.height / 2, width: self.detailView.frame.width - self.deliveryImage.frame.width - 20, height: self.detailView.frame.height - 5))
        self.lblDescription.numberOfLines = 0
        
        
        self.detailView.addSubview(self.deliveryImage)
        self.detailView.addSubview(self.lblDescription)
        self.view.addSubview(self.detailMap)
        self.view.addSubview(self.detailView)
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
