//
//  CloseButton.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/23/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct CloseButton: View {
    var action: () -> Void
    
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
            .onTapGesture {
                action()
            }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(action: {})
    }
}
