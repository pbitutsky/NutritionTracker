//
//  Save.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/16/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

func getDateAsString() -> String {
    let date = Date()
    let calender = Calendar.current
    let components = calender.dateComponents([.year,.month,.day], from: date)
    return String(components.year!) + "-" + String(components.month!) + "-" + String(components.day!)
}

/* Saves the foodStore under the current date */
func saveFoodStore(_ foodStore: FoodStore) {
    let defaultDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let writeDirectory = defaultDirectory.appendingPathComponent(getDateAsString())
    let payload: Data = try! JSONEncoder().encode(foodStore)
    try? payload.write(to: writeDirectory)
//    if let str = String(data: payload, encoding: .utf8) {
//        print(str)
//    }
}

func loadFoodStore() -> FoodStore? {
    let defaultDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let readDirectory = defaultDirectory.appendingPathComponent(getDateAsString())
    guard let payload = try? Data(contentsOf: readDirectory) else { return nil }
    return try? JSONDecoder().decode(FoodStore.self, from: payload)
}
