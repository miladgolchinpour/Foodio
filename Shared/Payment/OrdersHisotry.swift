//
//  OrdersHisotry.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/25/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct OrdersHisotry: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List {
                if orderViewModel.orderHistory.isEmpty {
                    Text("No orders recorded")
                } else {
                    ForEach(orderViewModel.orderHistory) { order in
                        NavigationLink(destination: OrderItemDetail(order: order)) {
                            VStack(alignment: .leading) {
                                Text("\(order.id)")
                                    .lineLimit(1)
                                Text("\(order.date, formatter: dateFormatter)")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("History")
            #if os(iOS)
            .navigationBarItems(trailing: Button("Back") { presentationMode.wrappedValue.dismiss() })
            #endif
        }
    }
}

struct OrdersHisotry_Previews: PreviewProvider {
    static var previews: some View {
        OrdersHisotry()
    }
}
