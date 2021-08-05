//
//  SuccessOrder.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/25/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct SuccessOrder: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "checkmark")
                .font(.system(size: 72))
                .foregroundColor(.green)
            Text("Your Order\nSuccessfully Submited")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Button("Back to app") {
                for _ in 1...4 {
                    presentationMode.wrappedValue.dismiss()
                }
                
                orderViewModel.addOrder()
                orderViewModel.foodCart = []
                orderViewModel.drinkCart = []
            }
            .padding(.top, 50)
        }
        #if os(iOS)
        .navigationBarHidden(true)
        #endif
        .interactiveDismissDisabled(true)
    }
}

struct SuccessOrder_Previews: PreviewProvider {
    static var previews: some View {
        SuccessOrder()
    }
}
