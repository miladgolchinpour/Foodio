//
//  FavoriteDrinks.swift
//  FavoriteDrinks
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FavoriteDrinks: View {
    var drinks: [Drink]
    
    var body: some View {
        if !drinks.isEmpty {
            Section(header: HStack{
                Text("DRINKS").font(.headline)
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.top, 30).padding()) {
                ForEach(drinks) { drink in
                    NavigationLink(destination: DrinkDetail(drink: drink)) {
                        DrinkItem(drink: drink).itemStyle(drink.color)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct FavoriteDrinks_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteDrinks(drinks: [])
    }
}
