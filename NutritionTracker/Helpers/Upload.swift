//
//  Upload.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/15/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

func publishFoodList(foodStore: FoodStore, _ completion: @escaping (Data?)->()){
    guard let url = URL(string: "https://paul.bitutsky.com/food/insertFoods"),
        let encodedFoodStore: Data = try? JSONEncoder().encode(foodStore) else {
            return
        }
    var payload = "auth_key=\(TERMINALTUTSKY_AUTH_KEY)&food_data=".data(using: .utf8)!
    payload.append(encodedFoodStore)

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = payload
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else { print(error!.localizedDescription); return }
        
        OperationQueue.main.addOperation {
            
            completion(data)
        }
        
        }.resume()
}

