//
//  Nutritionix.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/15/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import Foundation

func nutritionixApiCall(text: String, _ completion: @escaping (Data?)->()){
    guard let url = URL(string: "https://trackapi.nutritionix.com/v2/natural/nutrients"),
        let payload = "{\"query\": \"\(text)\"}".data(using: .utf8) else
    {
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue(NUTRITIONIX_APP_ID, forHTTPHeaderField: "X-App-Id")
    request.addValue(NUTRITIONIX_APP_KEY, forHTTPHeaderField: "X-App-Key")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = payload
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else { print(error!.localizedDescription); return }
        guard let data = data else { print("Empty data"); return }
        
        OperationQueue.main.addOperation {
            completion(data)
        }
        
        }.resume()
}
