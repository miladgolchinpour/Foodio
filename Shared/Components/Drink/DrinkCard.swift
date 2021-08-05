//
//  DrinkCard.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct DrinkCard: View {
    @EnvironmentObject var fvManager: FavoriteManager
    
    var drink: Drink?
    
    var isFavorite: Bool {
        guard let drink = drink else { return false }
        return fvManager.favoriteDrinksID.contains(drink.id)
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
                            guard let drink = drink else { return }
                            fvManager.toggleFavoriteDrink(drink: drink)
                        }
                    }, image: fvManager.isFavoriteDrink(drink: drink!) ? "heart.fill" : "heart")
                        .padding(20)
                        .zIndex(2)
                    
                    drinkCardImage(Image(drink!.image))
                        .zIndex(1)
                }
                
                drinkCardText(drink!.name)
                
                DrinkAvailablePriceView(drink: drink!)
            }
            
            Spacer()
            #if os(iOS)
            if horizontalSizeClass != .compact { Image("knife") }
            Spacer()
            #endif
        }
        .drinkCardStyle(drink: drink!)
    }
}

struct DrinkCard_Previews: PreviewProvider {
    static var previews: some View {
        DrinkCard(drink: DrinkViewModel().drinksList[0])
    }
}
