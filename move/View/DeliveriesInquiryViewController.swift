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
    var viewModel : DeliveriesInquiryViewModel!
    var spinner : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.spinner = UIActivityIndicatorView(style: .gray)
        if (self.viewModel == nil){
            self.viewModel = DeliveriesInquiryViewModel()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.setTblViewPage(pageNumber: 0)
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
        if (self.viewModel != nil){
            let lalamoveCell : CustomTableViewCell = (self.tblView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell)
            let data = self.viewModel.deliveryItemModels![indexPath.row]
            lalamoveCell.renderTableViewCell(with:data)
            return lalamoveCell
        }else{
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (self.viewModel != nil){
            if (indexPath.row + 1  == self.viewModel.deliveryItemModels!.count){
                self.showSpinnerLoadMore()
                self.viewModel.setTblViewPage(pageNumber: self.viewModel.dataPage + 1)
                self.viewModel.loadDataDeliveryItems { (responseString) in
                    self.stopSpinnerLoadMore()
                    if (responseString.elementsEqual("OK")){
                        self.tblView.reloadData()
                    }else{
                        print("load error")
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = self.viewModel.deliveryItemModels![indexPath.row]
        self.performSegue(withIdentifier: "segue_to_detail", sender: selectedData)
    }
    
    
    func showSpinnerLoadMore(){
        self.spinner.startAnimating()
        self.spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(self.tblView.bounds.width), height: CGFloat(44))
        self.tblView.tableFooterView = self.spinner
        self.tblView.tableFooterView?.isHidden = false
    }
    
    func stopSpinnerLoadMore(){
        self.spinner.stopAnimating()
        self.tblView.tableFooterView = nil
        self.tblView.tableFooterView?.isHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue_to_detail"){
            let nextVc = segue.destination as! DetailDeliveryViewController
            nextVc.viewModel = DetailDeliveryViewModel()
            nextVc.viewModel?.model = (sender as! DeliveryItemModel)
        }
    }
}

