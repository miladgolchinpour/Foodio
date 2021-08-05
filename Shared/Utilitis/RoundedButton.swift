//
//  RoundedButton.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {
    var title: LocalizedStringKey
    var action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Text(title)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.linearGradient(colors: [.indigo.opacity(0.7), .blue.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: 712)
            Spacer()
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Checkout", action: {})
    }
}
