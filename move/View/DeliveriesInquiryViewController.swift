//
//  ViewController.swift
//  move
//
//  Created by Noverio Joe on 07/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

class DeliveriesInquiryViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tblView: UITableView!
    private var viewModel : DeliveriesInquiryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.delegate = self;
        
        if (self.viewModel != nil){
            self.viewModel = DeliveriesInquiryViewModel()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell()
        
        return cell
    }
}

