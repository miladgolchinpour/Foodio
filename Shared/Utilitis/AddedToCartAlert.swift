//
//  AddedToCartAlert.swift
//  Foodio
//
//  Created by Milad Golchinpour on 7/27/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Added {
    static var addedToCartAlert: Alert {
        Alert(title: Text("Added!"), message: Text("Successfuly added to cart"), dismissButton: .cancel(Text("Back")))
    }
}
