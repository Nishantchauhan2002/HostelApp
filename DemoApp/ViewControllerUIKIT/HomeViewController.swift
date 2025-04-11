//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 31/03/25.
//

import UIKit
import SwiftUI

class HomeViewController: BaseViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGifFile();
        redirectToTheLoginView();
    }
    func addGifFile(){
        if let url = Bundle.main.url(forResource: "hostel", withExtension: "gif"),
           let gifData = try? Data(contentsOf: url),
           let gifImage = UIImage.gif(data: gifData) {
            self.gifImageView.image = gifImage
        }  
    }
    func redirectToTheLoginView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let loginView = RootView()
            _ = UIHostingController(rootView: loginView)
            //        self.navigationController?.setViewControllers([hostingVC], animated: true)
            
            UIView.transition(with: self.view.window!,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                self.view.window?.rootViewController = UIHostingController(rootView: RootView())
            },
                              completion: nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.toggleFooterVisibility(true)
    }
}
