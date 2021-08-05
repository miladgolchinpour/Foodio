//
//  FoodNutritionRow.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FoodNutritionRow: View {
    var food: Food
    
    var body: some View {
        let keys = food.nutrition.map{$0.key}
        let values = food.nutrition.map{$0.value}
        
        VStack {
            ForEach(keys.indices, id: \.self) { index in
                HStack {
                    let keyName = LocalizedStringKey(keys[index])
                    Text(keyName).textCase(.uppercase)
                    Spacer()
                    Text("\(values[index], specifier: "%.1f")")
                }
                Divider()
            }
        }
    }
}

struct FoodNutritionRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodNutritionRow(food: FoodViewModel().foodsList[0])
    }
}
