//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 31/03/25.
//

import UIKit
import SwiftUI

class BaseViewController: UIViewController {
    
    @IBOutlet weak var swiftUIViewController: UIView!
    
    
    private var hostingController: UIHostingController<BaseSwiftUIView>?
    private var isFooterHidden = false  // Track footer visibility
    
    override func viewDidLoad() {
           super.viewDidLoad()
            setupSwiftUIView()
       }

    private func setupSwiftUIView() {
        let swiftUIView = BaseSwiftUIView(
            onTabSelected: { [weak self] tabIndex in
                self?.handleTabSelection(tabIndex)
            },
            isFooterHidden: isFooterHidden
        )
        
        let hostingController = UIHostingController(rootView: swiftUIView)
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    private func handleTabSelection(_ tabIndex: Int) {
        switch tabIndex {
        case 0:
            print("ticket")
//            let vc = HomeViewController()
//            navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("service")
//            let vc = ProfileViewController()
//            navigationController?.pushViewController(vc, animated: true)
        case 2:
            print("home")
//            let vc = DashboardViewController()
//            navigationController?.pushViewController(vc, animated: true)
        case 3:
            print("food")
//            let vc = FoodViewController()
//            navigationController?.pushViewController(vc, animated: true)
        case 4:
            print("rupee")
//            let vc = PaymentsViewController()
//            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    func toggleFooterVisibility(_ hide: Bool) {
        isFooterHidden = hide
        hostingController?.rootView = BaseSwiftUIView(
            onTabSelected: { [weak self] tabIndex in
                self?.handleTabSelection(tabIndex)
            },
            isFooterHidden: isFooterHidden
        )
    }
}

  

 
  
