//
//  FoodDescription.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FoodDescription: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var food: Food
    
    @State private var addedToCart = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Description")
                .font(.headline)
            
            Text(food.description)
                .font(.subheadline)
                .opacity(0.7)
                .padding(.bottom, 15)
            
            Text("Food Nutrition")
                .font(.headline)
            
            FoodNutritionRow(food: food)
            
            RoundedButton(title: "Add to Cart") {
                orderViewModel.foodCart.append(food)
                addedToCart = true
            }
        }
        .padding()
        .alert(isPresented: $addedToCart) {
            Added.addedToCartAlert
        }
    }
}

struct FoodDescription_Previews: PreviewProvider {
    static var previews: some View {
        FoodDescription(food: FoodViewModel().foodsList[0])
    }
}
