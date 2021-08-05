//
//  DrinkItem.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct DrinkItem: View {
    var drink: Drink
    
    @Environment(\.locale) var locale
    
    var body: some View {
        HStack {
            Image(drink.image)
                .itemImageStyle()
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(drink.name)
                    .fontWeight(.bold)
                
                Text(locale.identifier == "en" ? "$\(drink.price)" : "\(drink.price) دلار")
                    .font(.footnote)
            }
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.vertical, 15)
        .background(drink.color)
    }
}

struct DrinkItem_Previews: PreviewProvider {
    static var previews: some View {
        DrinkItem(drink: DrinkViewModel().drinksList[0])
    }
}
