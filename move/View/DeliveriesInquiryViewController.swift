//
//  ViewController.swift
//  move
//
//  Created by Noverio Joe on 07/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import IJProgressView

class DeliveriesInquiryViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    private var viewModel : DeliveriesInquiryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (self.viewModel == nil){
            self.viewModel = DeliveriesInquiryViewModel()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        IJProgressView.shared.showProgressView()
        self.viewModel.loadDataDeliveryItems { (responseString) in
            IJProgressView.shared.hideProgressView()
            if (responseString.elementsEqual("OK")){
                print("load sukses")
            }else{
                print("load error")
            }
        }
    }
   
}

