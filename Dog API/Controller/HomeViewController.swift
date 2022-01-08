//
//  HomeViewController.swift
//  Dog API
//
//  Created by Mohammad Salhab on 08/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var tableView = DogFactsTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        if NetworkMonitor.shared.isConnected {
            print("You're connected")
        } else {
            print("You're not connected")
            let vc = NoInternetConnectionViewController()
            vc.tryAgainBtnHandler = { [weak self] in
                guard let `self` = self else { return }
                self.tableView.getDogsFacts()
            }
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
