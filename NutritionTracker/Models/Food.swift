//
//  Food.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/12/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

struct Food: Codable {
    var food_name: String
    var brand_name: String?
    var serving_qty: Double?
    var serving_unit: String?
    var serving_weight_grams: Double?
    var nf_calories: Double?
    var nf_total_fat: Double?
    var nf_saturated_fat: Double?
    var nf_cholesterol: Double?
    var nf_sodium: Double?
    var nf_total_carbohydrate: Double?
    var nf_dietary_fiber: Double?
    var nf_sugars: Double?
    var nf_protein: Double?
    var nf_potassium: Double?
    var nf_p: Double?
    var full_nutrients: [Nutrient]?
    var photo: Photo?
    
}

struct Nutrient: Codable {
    var attr_id: Int?
    var value: Double?
}

struct Photo: Codable {
    var thumb: String?
    var highres: String?
}
