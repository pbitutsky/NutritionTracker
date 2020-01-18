//
//  FoodEditingView.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/16/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import SwiftUI

struct FoodEditingView: View {
    @Binding var foodWrapper: FoodWrapper
    @State var calories: String
    
    var body: some View {
        Form {
            HStack {
                Text("Display Name:").bold()
                TextField("Display Name", text: $foodWrapper.food.food_name)
            }
            HStack {
                Text("Calories:").bold()
                TextField("Calories", text: $calories, onEditingChanged: {_ in
                    self.foodWrapper.food.nf_calories = Double(self.calories)
                })
            }
            
        }
    }
}

struct FoodEditingView_Previews: PreviewProvider {
    static var previews: some View {
        FoodEditingView(foodWrapper: .constant(FoodWrapper(food: Food(food_name: "Turkey"), meal: .breakfast)), calories: String(50.0))
    }
}
