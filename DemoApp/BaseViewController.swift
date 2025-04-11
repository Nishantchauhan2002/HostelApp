//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 31/03/25.
//

import UIKit
import SwiftUI

class BaseViewController: UIViewController {
    
    private var hostingController: UIHostingController<BaseSwiftUIView>?
    private var isFooterHidden = false  // Track footer visibility
    
    override func viewDidLoad() {
           super.viewDidLoad()
        setupSwiftUIBackground()
       }

//    private func setupSwiftUIView() {
//        let swiftUIView = BaseSwiftUIView(
//            onTabSelected: { [weak self] tabIndex in
//                self?.handleTabSelection(tabIndex)
//            },
//            isFooterHidden: isFooterHidden
//        )
//        
//        let hostingController = UIHostingController(rootView: swiftUIView)
//        self.hostingController = hostingController
//        addChild(hostingController)
//        guard let container = baseViewController else {
//            print("❌ baseViewController is nil")
//            return
//        }
//
//        container.addSubview(hostingController.view)
//
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: container.topAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
//            hostingController.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
//        ])
//
//        hostingController.didMove(toParent: self)
//        
//    }
    
    private func setupSwiftUIBackground() {
        let swiftUIView = BaseSwiftUIView(
            onTabSelected: { [weak self] index in
                self?.handleTabSelection(index)
            },
            isFooterHidden: isFooterHidden
        )

        let hostingController = UIHostingController(rootView: swiftUIView)
        self.hostingController = hostingController
        addChild(hostingController)

        // Add it BEHIND all UIKit views
        view.insertSubview(hostingController.view, at: 0)

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

 
  
