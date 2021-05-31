//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Egor Gorskikh on 31.05.2021.
//

import UIKit

class AboutMeVC: UIViewController {

    var amv: AboutMeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
 //       view.addSubview(amv.btn)
        
        NSLayoutConstraint.activate([
//            amv.btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            amv.btn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

