//
//  ViewController.swift
//  move
//
//  Created by Noverio Joe on 07/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit
import IJProgressView

class DeliveriesInquiryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tblView: UITableView!
    private var viewModel : DeliveriesInquiryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.register(UINib(nibName: "CustomTableViewCell", bundle: Bundle(identifier: "com.lala.move")), forCellReuseIdentifier: "lalamove_custom_cell")
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
                self.tblView.reloadData()
            }else{
                print("load error")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.viewModel == nil){
            return 0
        }else{
            return self.viewModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if (self.viewModel != nil){
            cell = CustomTableViewCell()
            let data = self.viewModel.deliveryItemModels![indexPath.row]
            (cell as! CustomTableViewCell).renderTableViewCell(with:data)
        }else{
            cell = UITableViewCell()
        }
        
        return cell!
    }
   
}

