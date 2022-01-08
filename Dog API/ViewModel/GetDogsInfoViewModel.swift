//
//  GetDogsInfoViewModel.swift
//  Dog API
//
//  Created by Mohammad Salhab on 07/01/2022.
//

import Foundation

class GetDogsInfoViewModel {
    
    internal var apiCallBack: ((_ success: Bool, _ dogFacts: [String]) -> Void)?
    
    internal func requestDogsFacts() {
        ServiceManager.shared.request(url: Constants.DogAPIFacts.url, method: .get) { [weak self] result in
            guard let `self` = self else { return }
            if let result = result {
                do {
                    let decoder = JSONDecoder()
                    let loadedData = try decoder.decode(DogsFactsModel.self, from: result)
                    if let success = loadedData.success {
                        if success {
                            if let dogFacts = loadedData.facts {
                                self.apiCallBack?(true, dogFacts)
                            } else {
                                self.apiCallBack?(false, [])
                            }
                        }
                    }
                } catch let jsonError as NSError {
                    print("JSON decode failed: \(jsonError.localizedDescription)")
                    self.apiCallBack?(false, [])
                }
            }
        } failure: { error in
            print(error?.debugDescription)
            self.apiCallBack?(false, [])
        }
    }
}
