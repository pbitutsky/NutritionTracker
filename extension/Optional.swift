//
//  Optional.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/16/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}
