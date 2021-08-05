//
//  WelcomeDetailContainer.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct Features: View {
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(showsIndicators: false) {
                FeatureView(title: "Fast", subTitle: "Select your favorite and order it in a minute", imageName: "speedometer")

                FeatureView(title: "Safe", subTitle: "Items delivery with no health issues in Covid-19 status", imageName: "heart")

                FeatureView(title: "History", subTitle: "You can see orders history with description", imageName: "list.bullet")
            }
        }
        .padding(.horizontal)
    }
}
