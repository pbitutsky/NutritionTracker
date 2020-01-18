//
//  MealSection.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/12/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import SwiftUI

struct MealSectionView: View {
    @Binding var mealFoods: FoodStore.MealFoods
    @State var foodStore: FoodStore
    
    var body: some View {
        Section(header: Text(mealFoods.meal.rawValue.capitalized)) {
            ForEach(mealFoods.foodWrappers) { index in
                NavigationLink(destination: FoodEditingView(foodWrapper: self.$mealFoods.foodWrappers[index], calories: String(self.mealFoods.foodWrappers[index].food.nf_calories ?? 0.0)).onDisappear(perform: {
                    saveFoodStore(self.foodStore)
                })) {
                    HStack {
                        ImageView(imageURL: self.mealFoods.foodWrappers[index].food.photo?.thumb)
                        Text(self.mealFoods.foodWrappers[index].food.food_name)
                        Spacer()
                        Text(String(self.mealFoods.foodWrappers[index].food.nf_calories ?? 0.0) + " calories")
                    
                    }
                }
            }.onDelete { indexSet in
                self.mealFoods.foodWrappers.remove(atOffsets: indexSet)
            }.onMove { sourceIndices, destinationIndex in
                self.mealFoods.foodWrappers.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
            }
        }
    }
}
