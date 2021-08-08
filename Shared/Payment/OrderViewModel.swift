//
//  Order.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// OrderViewModel
class OrderViewModel: ObservableObject {
    // MARK: Properties
    @Published var foodCart = [Food]()
    @Published var drinkCart = [Drink]()
    @Published var orderHistory = [Order]()
    
    // MARK: Methods
    func addOrder() {
        let order = Order(foods: foodCart, drinks: drinkCart, date: .now)
        orderHistory.append(order)
    }
}
