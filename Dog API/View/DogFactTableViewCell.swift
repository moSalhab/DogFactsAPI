//
//  DogFactTableViewCell.swift
//  Dog API
//
//  Created by Mohammad Salhab on 08/01/2022.
//

import UIKit

class DogFactTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var dogFactLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    internal func configureCell(dogFact: String) {
        self.dogFactLabel.text = dogFact
    }
    
    internal func isCollapse(isCollapsed: Bool) {
        if isCollapsed {
            self.dogFactLabel.numberOfLines = 1
        } else {
            self.dogFactLabel.numberOfLines = 0
        }
        UIImageView.animate(withDuration: 0.2) {
            if isCollapsed {
                self.arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
            } else {
                self.arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
            }
        }
    }
}
