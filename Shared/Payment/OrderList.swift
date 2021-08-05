//
//  OrderList.swift
//  OrderList
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct OrderList: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        ForEach(orderViewModel.foodCart) { item in
            FoodItem(food: item)
                .frame(height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: item.color.opacity(0.4), radius: 20, x: 0, y: 10)
                .padding(.horizontal)
                .contextMenu {
                    Button("Delete", role: .destructive) {
                        withAnimation(.easeInOut) {
                            orderViewModel.foodCart.removeAll { $0.id == item.id }
                        }
                    }
                }
        }
        
        ForEach(orderViewModel.drinkCart) { item in
            DrinkItem(drink: item)
                .frame(height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: item.color.opacity(0.4), radius: 20, x: 0, y: 10)
                .padding(.horizontal)
                .contextMenu {
                    Button("Delete", role: .destructive) {
                        withAnimation(.easeInOut) {
                            orderViewModel.drinkCart.removeAll { $0.id == item.id }
                        }
                    }
                }
        }
    }
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList()
    }
}
