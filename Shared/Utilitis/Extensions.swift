//
//  Extensions.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Food View Extension
extension View {
    // MARK: - Food Card Style
    func foodCardStyle(food: Food) -> some View {
        return self
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .background(food.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(x: 0, y: -30)
            .shadow(color: food.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
    // MARK: Food Card show Image
    func foodCardImage(_ image: Image) -> some View {
        return image
            .resizable()
            .scaledToFit()
            .cornerRadius(15)
            .padding()
    }
    
    // MARK: - Food Card Text show
    func foodCardText(_ text: LocalizedStringKey) -> some View {
        return Text(text)
            .font(.system(.largeTitle, design: .rounded))
            .fontWeight(.semibold)
            .textCase(.uppercase)
            .foregroundColor(.white)
    }
}

// MARK: - Drink View Extension
extension View {
    // MARK: - Drink Card Style
    func drinkCardStyle(drink: Drink) -> some View {
        return self
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .background(drink.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(x: 0, y: -30)
            .shadow(color: drink.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
    
    // MARK: Food Card show Image
    func drinkCardImage(_ image: Image) -> some View {
        return image
            .resizable()
            .scaledToFit()
            .cornerRadius(15)
            .padding()
    }
    
    // MARK: - Food Card Text show
    func drinkCardText(_ text: LocalizedStringKey) -> some View {
        return Text(text)
            .font(.system(.largeTitle, design: .rounded))
            .fontWeight(.semibold)
            .textCase(.uppercase)
            .foregroundColor(.white)
    }
    
    // MARK: - Item Styles
    func itemStyle(_ color: Color) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: color.opacity(0.4), radius: 20, x: 0, y: 10)
    }
}

// MARK: - Welcome Library
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(.headline, design: .rounded))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.indigo))
            .padding(.bottom)
    }
}

// MARK: - Custom welcome button
extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

// MARK: - Custom Title Text Style
extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36, design: .rounded))
    }
}

extension Image {
    func itemImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .cornerRadius(10)
    }
}
