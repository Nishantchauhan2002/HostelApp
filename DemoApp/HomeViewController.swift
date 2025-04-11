//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 31/03/25.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGifFile();
    }
    func addGifFile(){
        if let url = Bundle.main.url(forResource: "hostel", withExtension: "gif"),
           let gifData = try? Data(contentsOf: url),
           let gifImage = UIImage.gif(data: gifData) {
            self.gifImageView.image = gifImage
        }  
    }
    override func viewWillAppear(_ animated: Bool) {
        self.toggleFooterVisibility(true)
    }
}
