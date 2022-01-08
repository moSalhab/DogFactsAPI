//
//  NSObject+Extension.swift
//  Dog API
//
//  Created by Mohammad Salhab on 08/01/2022.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}
