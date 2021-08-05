//
//  Food.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Food Model
struct Food: Identifiable {
    var id = UUID()
    var name: LocalizedStringKey
    var description: LocalizedStringKey = lorem
    var image: String
    var price: Int = 200
    var color: Color
    var isAvailable: Bool = true
    var nutrition: [String: Double] = [
        "colories": 266,
        "fiber": 1.2,
        "fat": 10.1,
        "carbs": 30.0,
        "protein": 13.3
    ]
}

/// Example lorem text
var lorem: LocalizedStringKey = "lorem.text"
