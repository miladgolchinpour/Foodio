//
//  FavoriteItems.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FavoriteItems: View {
    @EnvironmentObject var fvManager: FavoriteManager
    
    var body: some View {
        if fvManager.favoriteFoods.isEmpty && fvManager.favoriteDrinks.isEmpty {
            VStack(spacing: 20) {
                Image(systemName: "heart.fill").font(.largeTitle)
                Text("No favorite item founded!")
            }
            .navigationTitle("Favorites")
        } else {
            ScrollView {
                VStack {
                    FavoriteFoods(foods: fvManager.favoriteFoods)
                    
                    FavoriteDrinks(drinks: fvManager.favoriteDrinks)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            .frame(maxWidth: 712)
            .navigationTitle("Favorites")
        }
    }
}

struct FavoriteItems_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteItems()
            .environmentObject(FavoriteManager())
    }
}
