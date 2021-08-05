//
//  Drink.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Drink Model
struct Drink: Identifiable {
    var id = UUID()
    var name: LocalizedStringKey
    var description: LocalizedStringKey = lorem
    var image: String
    var price: Int = 200
    var color: Color
    var isAvailable: Bool = true
    var coloreis: Double
}
