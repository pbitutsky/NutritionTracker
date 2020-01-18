//
//  ContentView.swift
//  NutritionTracker
//
//  Created by Paul Bitutsky on 1/12/20.
//  Copyright © 2020 Paul Bitutsky. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var foodStore: FoodStore
    @State var modalIsPresented = false
    @State var showAlert = false
    @State var alertText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(foodStore.mealFoods) { index in
                        if self.foodStore.mealFoods[index].foodWrappers.isEmpty {
                            AnyView(EmptyView())
                        } else {
                            AnyView(MealSectionView(mealFoods: self.$foodStore.mealFoods[index], foodStore: self.foodStore))
                        }
                        
                    }
                }.listStyle(GroupedListStyle())
                .navigationBarTitle("Foods")
                .navigationBarItems(
                        leading: EditButton(),
                        trailing:
                            Button(
                                action: { self.modalIsPresented=true}
                            ) {
                                Image(systemName: "plus")
                            }
                )
            
                HStack {
                    Text("Total Calories: \(String(format: "%.2f",  foodStore.totalCalories))").bold()
                    Spacer()
                    Button(action: {publishFoodList(foodStore: self.foodStore) {data in
                        guard let data = data else { print("Empty data"); return }
                        let stringData = String(data:data, encoding: .utf8)
                        if stringData == "{\"Success!\"}" {
                            self.alertText = "Successfully published food data to paul.bitutsky.com"
                        } else {
                            self.alertText = "Error publishing food data to paul.bitutsky.com"
                        }
                        self.showAlert = true
                        }}) {
                        Text("Publish")
                    }.disabled(foodStore.totalCalories == 0.0)
                        .alert(isPresented: $showAlert) { () -> Alert in
                            Alert(title: Text(alertText))
                    }
                }.padding(EdgeInsets(top: 0.0, leading: 15.0, bottom: 0.0, trailing: 15.0))
            }
        }.sheet(isPresented: $modalIsPresented) {
            NewEntryView(foodStore: self.foodStore)
        }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(foodStore: FoodStore())
    }
}
