//
//  FavoriteFoods.swift
//  FavoriteFoods
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FavoriteFoods: View {
    var foods: [Food]
    
    var body: some View {
        if !foods.isEmpty {
            Section(header: HStack{
                Text("FOODS").font(.headline)
            }.frame(maxWidth: .infinity, alignment: .leading).padding()) {
                ForEach(foods) { food in
                    NavigationLink(destination: FoodDetail(food: food)) {
                        FoodItem(food: food).itemStyle(food.color)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct FavoriteFoods_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteFoods(foods: [])
    }
}
