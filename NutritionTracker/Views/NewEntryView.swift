//
//  NewEntryView.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/15/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import SwiftUI

struct NewEntryView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var meal: Meal = getMealFromTime(date: Date())
    @State var text = ""
    var foodStore: FoodStore
    
    var body: some View {
        Form {
            TextField("What did I eat?", text: $text)
            VStack {
                Text("Meal")
                Picker("Meal", selection: $meal.caseIndex) {
                    ForEach ( Meal.allCases.indices ) { priorityIndex in
                        Text(
                            Meal.allCases[priorityIndex].rawValue.capitalized
                        ).tag(priorityIndex)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Button("Add") {
                let selectedMealIndex = self.foodStore.getIndex(for: self.meal)
                
                nutritionixApiCall(text: self.text) {
                    data in
                    guard let data = data else {
                        print("ALERT! No data!")
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let decodedJSONResponse = try decoder.decode(NutritionixJSONResponse.self, from: data)
                        self.foodStore.mealFoods[selectedMealIndex].foodWrappers.append(contentsOf: decodedJSONResponse.foods.map {FoodWrapper(food: $0, meal: self.meal)})
                        saveFoodStore(self.foodStore)
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.disabled(text.isEmpty)
        }
    }
}

struct NewEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NewEntryView(foodStore: FoodStore())
    }
}
