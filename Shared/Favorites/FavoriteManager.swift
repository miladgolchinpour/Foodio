//
//  FavoriteManager.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation
import SwiftUI

class FavoriteManager: ObservableObject {
    // MARK: Properties
    @Published var favoriteFoods = [Food]()
    @Published var favoriteDrinks = [Drink]()
    @Published var favoriteFoodsID = Set<Food.ID>()
    @Published var favoriteDrinksID = Set<Drink.ID>()
    
    // MARK: Methods
    func toggleFavoriteFood(food: Food) {
        if favoriteFoodsID.contains(food.id) {
            favoriteFoodsID.remove(food.id)
            favoriteFoods.removeAll { $0.id == food.id }
        } else {
            favoriteFoodsID.insert(food.id)
            favoriteFoods.append(food)
        }
    }
    
    func toggleFavoriteDrink(drink: Drink) {
        if favoriteDrinksID.contains(drink.id) {
            favoriteDrinksID.remove(drink.id)
            favoriteDrinks.removeAll { $0.id == drink.id }
        } else {
            favoriteDrinksID.insert(drink.id)
            favoriteDrinks.append(drink)
        }
    }
    
    func isFavoriteFood(food: Food) -> Bool {
        favoriteFoodsID.contains(food.id)
    }
    
    func isFavoriteDrink(drink: Drink) -> Bool {
        favoriteDrinksID.contains(drink.id)
    }
}
