//
//  Sidebar.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Sidebar: View {
    @EnvironmentObject var app: Settings
    
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("Foodio")
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            #endif
            
            // MARK: Default View
            Foods()
        }
    }
    
    private var content: some View {
        List {
            NavigationLink(destination: Foods()) {
                Label("Foods", systemImage: "fork.knife")
            }
            NavigationLink(destination: Drinks()) {
                Label("Drinks", systemImage: "takeoutbag.and.cup.and.straw")
            }
            NavigationLink(destination: Orders()) {
                Label("Order", systemImage: "cart")
            }
            NavigationLink(destination: FavoriteItems()) {
                Label("Favorites", systemImage: "heart")
            }
        }
        .listStyle(.sidebar)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar().colorScheme(.dark)
    }
}
