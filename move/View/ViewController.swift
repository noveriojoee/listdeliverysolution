//
//  ViewController.swift
//  move
//
//  Created by Noverio Joe on 07/09/19.
//  Copyright © 2019 lalamove. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.delegate = self;
    }
    
    
}

