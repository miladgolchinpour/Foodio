//
//  FoodDetail.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FoodDetail: View {
    var food: Food
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView(showsIndicators: false) {
                VStack {
                    FoodCard(food: food)
                    
                    FoodDescription(food: food)
                    
                    Spacer()
                }
                .padding(.bottom, 100)
                .zIndex(1)
            }
            
            #if os(iOS)
            CloseButton(action: { presentationMode.wrappedValue.dismiss() })
                .padding(.top, 50)
                .padding(.trailing)
                .zIndex(2)
            #endif
        }
        #if os(iOS)
        .navigationBarHidden(true)
        #endif
        .edgesIgnoringSafeArea(.all)
        .background(.thinMaterial)
    }
}

struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(food: FoodViewModel().foodsList[0])
    }
}
