//
//  TabBar.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var app: Settings
    
    var body: some View {
        TabView(selection: $app.tabSelection) {
            NavigationView { Foods() }
                .tabItem {
                    Label("Foods", systemImage: "fork.knife")
                }
                .tag(TabSelection.food)
            
            NavigationView { Drinks() }
                .tabItem {
                    Label("Drinks", systemImage: "takeoutbag.and.cup.and.straw")
                }
                .tag(TabSelection.drink)
            
            NavigationView{ Orders() }
                .tabItem {
                    Label("Order", systemImage: "cart")
                }
                .tag(TabSelection.order)
            
            NavigationView { FavoriteItems() }
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(TabSelection.favorites)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
