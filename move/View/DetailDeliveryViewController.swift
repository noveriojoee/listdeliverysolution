//
//  DetailDeliveryViewController.swift
//  move
//
//  Created by Noverio Joe on 10/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

class DetailDeliveryViewController: UIViewController {

    var viewModel : DetailDeliveryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.viewModel == nil){
            self.viewModel = DetailDeliveryViewModel()
        }
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
