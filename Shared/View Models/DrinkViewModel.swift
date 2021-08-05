//
//  DrinkViewModel.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// All Drinks Data
class DrinkViewModel: ObservableObject {
    @Published private(set) var drinksList = [
        Drink(
            name: "COSMOPOLITAN", image: "COSMOPOLITAN", price: 2, color: .indigo, coloreis: 122
        ),
        Drink(
            name: "TOM COLLINS", image: "TOM COLLINS", price: 5, color: .cyan, coloreis: 122
        ),
        Drink(
            name: "BRANDY CRUSTA", image: "BRANDY CRUSTA", price: 3, color: .pink, coloreis: 122
        ),
        Drink(
            name: "AMERICANO", image: "AMERICANO", price: 10, color: .brown, coloreis: 122
        ),
        Drink(
            name: "SAZERAC", image: "SAZERAC", price: 7, color: .blue, coloreis: 122
        ),
        Drink(
            name: "DARK ’N’ STORMY", image: "DARK ’N’ STORMY", price: 8, color: .orange, coloreis: 122
        ),
        Drink(
            name: "MARGARITA", image: "MARGARITA", price: 10, color: .purple, coloreis: 122
        ),
        Drink(
            name: "MOJITO", image: "MOJITO", price: 4, color: .green, coloreis: 122
        ),
        Drink(
            name: "AVIATION", image: "AVIATION", price: 9, color: .mint, coloreis: 122
        ),
    ]
}
