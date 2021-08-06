//
//  FoodAvailavlePriceView.swift
//  Foodio
//
//  Created by Milad Golchinpour on 7/27/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FoodAvailavlePriceView: View {
    var food: Food
    
    @Environment(\.locale) var locale
    
    var body: some View {
        HStack(spacing: 10) {
            Text(locale.identifier == "en" ? "$\(food.price)" : "\(food.price) دلار")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text(food.isAvailable ? "Available" : "Unvailable")
                .italic()
                .padding(14)
                .background(.black.opacity(0.3))
                .cornerRadius(30)
                .foregroundColor(.white)
        }
        .padding(.bottom, 25)
    }
}
