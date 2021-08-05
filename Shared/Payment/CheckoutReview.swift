//
//  CheckoutReview.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/25/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct CheckoutReview: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        Form {
            Section(LocalizedStringKey("Order items")) {
                ForEach(orderViewModel.foodCart, id: \.id) { item in
                    Text(item.name).foregroundColor(.blue)
                }
                ForEach(orderViewModel.drinkCart, id: \.id) { item in
                    Text(item.name).foregroundColor(.blue)
                }
            }
            
            Section {
                NavigationLink(destination: SuccessOrder()) {
                    Text("Order Now")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .navigationTitle("Review")
    }
}

struct CheckoutReview_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutReview()
    }
}
