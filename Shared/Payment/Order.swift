//
//  Order.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/25/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation

/// Order Model
struct Order: Identifiable {
    var id = UUID().uuidString
    var foods: [Food]
    var drinks: [Drink]
    var date: Date
}
