//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 31/03/25.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.toggleFooterVisibility(false)
    }
}
