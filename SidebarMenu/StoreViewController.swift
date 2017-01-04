//
//  StoreViewController.swift
//  Boxing
//
//  Created by Kushagra Gusain on 05/08/16.
//  Copyright © 2016 Kushagra. All rights reserved.
//


import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
    }
}