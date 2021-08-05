//
//  FavoriteButton.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    var action: () -> Void
    var image: String
    
    var body: some View {
        Image(systemName: image)
            .foregroundColor(.red)
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color.black.opacity(1))
            .clipShape(Circle())
            .onTapGesture {
                action()
            }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(action: {}, image: "heart")
    }
}
