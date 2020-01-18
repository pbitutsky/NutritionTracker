//
//  FoodWrapper.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/12/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

struct FoodWrapper: Identifiable, Codable {
    let id = UUID()
    var food: Food
    var meal: Meal
}
