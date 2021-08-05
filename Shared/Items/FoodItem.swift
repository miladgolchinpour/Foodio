//
//  FoodItem.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FoodItem: View {
    var food: Food
    
    @Environment(\.locale) var locale
    
    var body: some View {
        HStack {
            Image(food.image)
                .itemImageStyle()
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(food.name)
                    .fontWeight(.bold)
                
                Text(locale.identifier == "en" ? "$\(food.price)" : "\(food.price) دلار")
                    .font(.footnote)
            }
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.vertical, 15)
        .background(food.color)
    }
}

struct FoodItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FoodItem(food: FoodViewModel().foodsList[0])
        }
    }
}
