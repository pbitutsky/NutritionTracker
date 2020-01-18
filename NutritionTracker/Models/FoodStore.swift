//
//  FoodStore.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/12/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

class FoodStore: ObservableObject, Codable {
    struct MealFoods: Identifiable, Codable {
        var id: Meal { meal } // not sure why I need this
        var meal: Meal
        var foodWrappers: [FoodWrapper]
    }
    
    @Published var mealFoods: [MealFoods] = []
    
    init() {
        self.mealFoods = []
        for meal in Meal.allCases {
            self.mealFoods.append(MealFoods(meal: meal, foodWrappers: []))
        }
    }

    func getIndex(for meal: Meal) -> Int {
        for index in 0..<self.mealFoods.count {
            if mealFoods[index].meal == meal {
                return index
            }
        }
        return -1
    }

    var totalCalories: Double {
        get {
            var total = 0.0
            for mealFood in mealFoods {
                for foodWrapper in mealFood.foodWrappers {
                    total += foodWrapper.food.nf_calories ?? 0.0
                }
            }
            return total
        }
    }
    
    
    // The following code is from https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties
    // It's needed to make this class Codable
    enum CodingKeys: CodingKey {
        case mealFoods
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mealFoods = try container.decode([MealFoods].self, forKey: .mealFoods)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mealFoods, forKey: .mealFoods)
    }
}
