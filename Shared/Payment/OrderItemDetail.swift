//
//  OrderItemDetail.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/25/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct OrderItemDetail: View {
    var order: Order
    
    var body: some View {
        List {
            Section(header: Text("Detail")) {
                Text("Order date : \(order.date, style: .date)")
                Text("Order code :\n\(order.id)").font(.footnote)
            }
            
            if !order.foods.isEmpty {
                Section(header: Text("Foods")) {
                    ForEach(order.foods) { food in
                        HStack {
                            Image(food.image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .frame(maxWidth: 80)
                            VStack(alignment: .leading) {
                                Text(food.name)
                                Text("$\(food.price)")
                            }
                            Spacer()
                        }
                    }
                }
            }
            
            if !order.drinks.isEmpty {
                Section(header: Text("Drinks")) {
                    ForEach(order.drinks) { drink in
                        HStack {
                            Image(drink.image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .frame(maxWidth: 80)
                            VStack(alignment: .leading) {
                                Text(drink.name)
                                Text("$\(drink.price)")
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationTitle("Information")
    }
}
