//
//  WhatsNewSheet.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct WhatsNewSheet: View {
    @EnvironmentObject var app: Settings
    
    #if os(iOS)
    @Environment(\.presentationMode) var presentationMode
    #endif
    
    var body: some View {
        VStack {
            NTitleView()
            
            NFeatures()
            
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
            
            Spacer()
        }
        .padding([.horizontal, .bottom])
    }
}

struct WhatsNewSheet_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewSheet()
    }
}
