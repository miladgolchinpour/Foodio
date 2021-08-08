//
//  DrinkAvailablePriceView.swift
//  Foodio
//
//  Created by Milad Golchinpour on 7/27/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct DrinkAvailablePriceView: View {
    var drink: Drink
    
    @Environment(\.locale) var locale
    
    var body: some View {
        HStack(spacing: 10) {
            Text(locale.identifier == "en" ? "$\(drink.price)" : "\(drink.price) دلار")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text(drink.isAvailable ? "Available" : "Unavailable")
                .italic()
                .padding(14)
                .background(.black.opacity(0.3))
                .cornerRadius(30)
                .foregroundColor(.white)
        }
        .padding(.bottom, 25)
    }
}
