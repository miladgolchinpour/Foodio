//
//  Orders.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// All Orders List
struct Orders: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    @EnvironmentObject var app: Settings
    
    @State private var showCheckOut = false
    @State private var showHistory = false
    
    var body: some View {
        if orderViewModel.foodCart.isEmpty && orderViewModel.drinkCart.isEmpty {
            VStack(spacing: 25) {
                Image(systemName: "cart.badge.plus").font(.largeTitle)
                Text("Cart is empty!")
                Button("Let's add items...") { app.tabSelection = .food }
                Button("Show History") { showHistory.toggle() }
            }
            .sheet(isPresented: $showHistory) { OrdersHisotry() }
            .navigationTitle("Order")
        } else {
            ScrollView {
                VStack(spacing: 20) {
                    OrderList()
                }
                .padding(.horizontal)
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    RoundedButton(title: "Checkout") { showCheckOut.toggle() }
                    .padding(10)
                }.background(.bar)
            }
            .sheet(isPresented: $showCheckOut) { CheckoutView() }
            .sheet(isPresented: $showHistory) { OrdersHisotry() }
            .padding(.vertical)
            .frame(maxWidth: 712)
            .navigationTitle("Order")
            .toolbar {
                Button("History") { showHistory.toggle() }
            }
        }
    }
}
