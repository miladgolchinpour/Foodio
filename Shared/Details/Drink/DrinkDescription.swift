//
//  DrinkDescription.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct DrinkDescription: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var drink: Drink
    
    @State private var addedToCart = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Description")
                .font(.headline)
            
            Text(drink.description)
                .font(.subheadline)
                .opacity(0.7)
                .padding(.bottom, 15)
            
            HStack {
                Text("Colories")
                Spacer()
                Text("\(drink.coloreis, specifier: "%.1f")")
            }
            Divider()
            
            RoundedButton(title: "Add to Cart") {
                orderViewModel.drinkCart.append(drink)
                addedToCart = true
            }
        }
        .padding()
        .alert(isPresented: $addedToCart) {
            Added.adddedToCartAlert
        }
    }
}

struct DrinkDescription_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDescription(drink: DrinkViewModel().drinksList[0])
            .environmentObject(OrderViewModel())
    }
}
