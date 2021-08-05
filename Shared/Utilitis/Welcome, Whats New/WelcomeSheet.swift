//
//  WelcomeSheet.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct WelcomeSheet: View {
    @EnvironmentObject var app: Settings
    
    #if os(iOS)
    @Environment(\.presentationMode) var presentationMode
    #endif
    
    var body: some View {
        VStack {
            TitleView()
            
            Features()
            
            Spacer()
            
            Button {
                #if os(iOS)
                presentationMode.wrappedValue.dismiss()
                #endif
                app.isShowWelcome = false
            } label: {
                Text("Continue")
                    .customButton()
            }
            .buttonStyle(.plain)
        }
        .padding([.horizontal, .bottom])
        .interactiveDismissDisabled(true)
    }
}

struct WelcomeSheet_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSheet()
    }
}
