//
//  FoodCard.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FoodCard: View {
    @EnvironmentObject var fvManager: FavoriteManager
    
    @State var food: Food?
    
    var isFavorite: Bool {
        guard let food = food else { return false }
        return fvManager.favoriteFoodsID.contains(food.id)
    }

    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    var body: some View {
        HStack {
            #if os(iOS)
            Spacer()
            if horizontalSizeClass != .compact { Image("fork") }
            #endif
            Spacer()
            
            VStack(spacing: 15) {
                Spacer().frame(maxHeight: 80)
                
                ZStack(alignment: .bottomLeading) {
                    FavoriteButton(action: {
                        withAnimation(.spring()) {
                            guard let food = food else { return }
                            fvManager.toggleFavoriteFood(food: food)
                        }
                    }, image: fvManager.isFavoriteFood(food: food!) ? "heart.fill" : "heart")
                        .padding(20)
                        .zIndex(2)
                    
                    foodCardImage(Image(food!.image))
                        .zIndex(1)
                }
                
                foodCardText(food!.name)
                
                FoodAvailablePriceView(food: food!)
            }
            
            Spacer()
            #if os(iOS)
            if horizontalSizeClass != .compact { Image("knife") }
            Spacer()
            #endif
        }
        .foodCardStyle(food: food!)
    }
}

struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard(food: FoodViewModel().foodsList[0])
    }
}
