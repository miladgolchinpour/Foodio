//
//  Drinks.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Drinks: View {
    @StateObject private var drinks = DrinkViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 16)], spacing: 16) {
                ForEach(drinks.drinksList) { drink in
                    NavigationLink(destination: DrinkDetail(drink: drink)) {
                        DrinkItem(drink: drink)
                            .itemStyle(drink.color)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(10)
        }
        .navigationTitle("Drinks")
    }
}

struct Drinks_Previews: PreviewProvider {
    static var previews: some View {
        Drinks()
    }
}
