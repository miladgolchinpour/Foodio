//
//  WelcomeTitleView.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation


import SwiftUI

struct NTitleView: View {
    var body: some View {
        VStack {
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100, alignment: .center)
                .cornerRadius(20)
                .accessibility(hidden: true)

            Text("Foodio App")
                .customTitleText()

            Text("New Features")
                .customTitleText()
                .foregroundColor(.indigo)
        }
        .padding(.top, 40)
    }
}
