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
    
    var tblView: UITableView!
    var viewModel : DeliveriesInquiryViewModel!
    var spinner : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawUI()
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
    
    func drawUI(){
        self.tblView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(self.tblView)
        self.tblView.delegate = self
        self.tblView.dataSource = self
//        self.tblView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.tblView.register(DeliveryItemTableViewCell.self, forCellReuseIdentifier: "cell")
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
            let lalamoveCell : DeliveryItemTableViewCell = (self.tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryItemTableViewCell)
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
        self.goToDetailPage(model: selectedData)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
    
    func goToDetailPage(model object : DeliveryItemModel){
        let nextVc = DetailDeliveryViewController()
        nextVc.viewModel = DetailDeliveryViewModel()
        nextVc.viewModel?.model = object
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
}

