//
//  DogFactsModel.swift
//  Dog API
//
//  Created by Mohammad Salhab on 07/01/2022.
//

import Foundation

// MARK: - DogsFactsModel
struct DogsFactsModel: Codable {
    let facts: [String]?
    let success: Bool?
}
