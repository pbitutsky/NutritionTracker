//
//  Meal.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/12/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

enum Meal: String, CaseIterable, Codable {
    case breakfast, lunch, dinner, snack, drinks
}

func getMealFromTime(date: Date, lastMeal: Meal? = nil) -> Meal {
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let snackOrMeal: (Meal) -> (Meal) = {
        if lastMeal == $0 {
            return .snack
        } else {
            return $0
        }
    }
    if hour <= 12 {
        return snackOrMeal(.breakfast)
    } else if hour <= 4+12 {
        return snackOrMeal(.lunch)
    } else if hour <= 9+12 {
        return snackOrMeal(.dinner)
    } else {
        return snackOrMeal(.drinks)
    }
}
