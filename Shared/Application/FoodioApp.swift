//
//  FoodioApp.swift
//  Shared
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

@main
struct FoodioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Settings())
                .environmentObject(FavoriteManager())
                .environmentObject(OrderViewModel())
            #if os(macOS)
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
                    for window in NSApplication.shared.windows {
                        window.standardWindowButton(.zoomButton)?.isEnabled = false
                    }
                })
            #endif
        }
    }
}
