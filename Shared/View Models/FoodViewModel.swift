//
//  FoodViewModel.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// All Foods Data
class FoodViewModel: ObservableObject {
    @Published private(set) var foodsList = [
        Food(name: "Burger King Whopper", image: "Burger King Whopper", price: 12, color: .blue),
        Food(name: "Five Guys Cheeseburger", image: "Five Guys Cheeseburger", price: 22, color: .pink),
        Food(name: "KFC Original Recipe Chicken", image: "KFC Original Recipe Chicken", price: 20, color: .green),
        Food(name: "White Castle Sliders", image: "White Castle Sliders", price: 34, color: .purple),
        Food(name: "Arby's Roast Beef Sandwich", image: "Arby's Roast Beef Sandwich", price: 10, color: .brown),
        Food(name: "Chick-fil-A Chicken Sandwich", image: "Chick-fil-A Chicken Sandwich", price: 6, color: .cyan),
        Food(name: "Culver's ButterBurger", image: "Culver's ButterBurger", price: 45, color: .indigo),
        Food(name: "Panda Express Kung Pao Chicken", image: "Panda Express Kung Pao Chicken", price: 50, color: .orange),
        Food(name: "Subway Chicken & Bacon Ranch Melt", image: "Subway Chicken & Bacon Ranch Melt", price: 15, color: .mint),
        Food(name: "Whataburger Original Whataburger", image: "Whataburger Original Whataburger", price: 20, color: .pink),
        Food(name: "Popeyes Chicken Sandwich", image: "Popeyes Chicken Sandwich", price: 17, color: .blue),
        Food(name: "Little Caesars Crazy Bread", image: "Little Caesars Crazy Bread", price: 28, color: .green),
        Food(name: "Domino's Extravaganza Pizza", image: "Domino's Extravaganza Pizza", price: 25, color: .purple),
        Food(name: "Jack in the Box Tacos", image: "Jack in the Box Tacos", price: 3, color: .brown),
    ]
}
