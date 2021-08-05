//
//  ContentView.swift
//  Shared
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var app: Settings
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var hSizeClass
    #endif
    
    @ViewBuilder
    var body: some View {
        VStack {
            #if os(iOS)
            if hSizeClass == .compact {
                TabBar().statusBar(hidden: false)
            } else {
                Sidebar().statusBar(hidden: true)
            }
            #else
            Sidebar().frame(width: 1000, height: 600)
            #endif
        }
        .onAppear {
            app.checkForUpdates()
        }
        .sheet(isPresented: $app.isShowWelcome, onDismiss: { app.isShowWelcome = false }) {
            WelcomeSheet()
        }
        .sheet(isPresented: $app.showWhatsNew) {
            WhatsNewSheet()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
