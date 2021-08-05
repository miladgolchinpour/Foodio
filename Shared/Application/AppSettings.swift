//
//  AppSettings.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation
import SwiftUI

/// Tab View Selection
enum TabSelection {
    case food, drink, order, favorites
}

class Settings: ObservableObject {
    // MARK: Properties
    @AppStorage("welcome") var isShowWelcome: Bool = true
    @AppStorage("whatsNew") var showWhatsNew: Bool = true
    
    @Published var tabSelection: TabSelection = .food
    
    // MARK: Methods
    func getCurrentAppVersion() -> String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        return (version as! String)
    }
    
    func checkForUpdates() {
        let appVersion = getCurrentAppVersion()
        let savedVersion = UserDefaults.standard.string(forKey: "savedVersion")
        
        if savedVersion != appVersion {
            if showWhatsNew { showWhatsNew = false } else { showWhatsNew = true }
            UserDefaults.standard.set(appVersion, forKey: "savedVersion")
        }
    }
}
