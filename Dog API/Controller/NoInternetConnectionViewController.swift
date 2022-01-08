//
//  NoInternetConnectionViewController.swift
//  Dog API
//
//  Created by Mohammad Salhab on 08/01/2022.
//

import UIKit

class NoInternetConnectionViewController: UIViewController {
    
    internal var tryAgainBtnHandler: (() -> Void)?

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tryAgainBtnTapped(_ sender: Any) {
        if NetworkMonitor.shared.isConnected {
            self.dismiss(animated: true) {
                self.tryAgainBtnHandler?()
            }
        }
    }
}
