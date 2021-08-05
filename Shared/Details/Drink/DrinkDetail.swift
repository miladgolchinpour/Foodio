//
//  DrinkDetail.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    var drink: Drink
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView(showsIndicators: false) {
                VStack {
                    DrinkCard(drink: drink)
                    
                    DrinkDescription(drink: drink)
                    
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

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: DrinkViewModel().drinksList[0])
    }
}
