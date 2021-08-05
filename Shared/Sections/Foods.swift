//
//  Foods.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Foods: View {
    @StateObject private var foods = FoodViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 16)], spacing: 16) {
                ForEach(foods.foodsList) { food in
                    NavigationLink(destination: FoodDetail(food: food)) {
                        FoodItem(food: food)
                            .itemStyle(food.color)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(10)
        }
        .navigationTitle("Foods")
    }
}

struct Foods_Previews: PreviewProvider {
    static var previews: some View {
        Foods()
    }
}
