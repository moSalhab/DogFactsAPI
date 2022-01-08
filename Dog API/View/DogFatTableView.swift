//
//  DogFactsTableView.swift
//  Dog API
//
//  Created by Mohammad Salhab on 08/01/2022.
//

import Foundation
import UIKit

class DogFactsTableView: UITableView {
    
    // MARK: Properties
    let dogFactsViewModel = GetDogsInfoViewModel()
    private var expandedIndexSet : IndexSet = []
    private var dogFacts: [String] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    // MARK: Init Table View
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        tableViewConfiguartion()
        getDogsFacts()
    }     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tableViewConfiguartion() {
        self.register(UINib(nibName: DogFactTableViewCell.className, bundle: nil), forCellReuseIdentifier: DogFactTableViewCell.className)
        self.separatorStyle = .none
        self.dataSource = self
        self.delegate = self
    }
    
    internal func getDogsFacts() {
        dogFactsViewModel.apiCallBack = { [weak self] success, dogFacts in
            guard let `self` = self else { return }
            if success {
                print(dogFacts)
                self.dogFacts = dogFacts
            }
        }
        dogFactsViewModel.requestDogsFacts()
    }
}

// MARK: - Table View Delegate
extension DogFactsTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedIndexSet.contains(indexPath.row) { expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - Table View Data Source
extension DogFactsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DogFactTableViewCell.className) as? DogFactTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell.configureCell(dogFact: dogFacts[indexPath.row])
        if expandedIndexSet.contains(indexPath.row) {
            cell.isCollapse(isCollapsed: false)
        } else {
            cell.isCollapse(isCollapsed: true)
        }
        return cell
    }
}
