//
//  CheckoutView.swift
//  Foodio
//
//  Created by Milad Golchinpour on 6/24/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.locale) var locale
    
    // delivery time
    let deliveryTimeTypes: [LocalizedStringKey] = ["Now", "Tonight"]
    @State private var deliveryTime: LocalizedStringKey = "Now"
    
    // tip amount
    let tipAmounts = [0, 10, 15, 20, 25]
    @State private var tipAmount = 10
    
    // address and name
    @State private var fullName = ""
    @State private var city = ""
    @State private var zipCode = ""
    @State private var streetAddress = ""
    
    // total price
    var total: Double {
        var totalValue = 0
        
        let foodPrices = orderViewModel.foodCart.map { $0.price }
        let drinksPrices = orderViewModel.drinkCart.map { $0.price }
        let allPrices = foodPrices + drinksPrices
        
        for i in allPrices { totalValue += i }
        
        let total = Double(totalValue)
        let tipValue = total / 100 * Double(tipAmount)
        let value = total + tipValue
        
        return value
    }
    
    // check for correct address and name
    var isDisabled: Bool {
        if fullName.isEmpty || city.isEmpty || zipCode.isEmpty || streetAddress.isEmpty {
            return true
        } else { return false }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Delivery time")) {
                    Picker("Delivery Time", selection: $deliveryTime) {
                        ForEach(deliveryTimeTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Add a tip?")) {
                    Picker("tip", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(
                        locale == .init(identifier: "en") ?
                        "Total: $\(total, specifier: "%.2f")" :
                            "جمع پرداختی: \(total, specifier: "%.2f") دلار"
                    )
                    .font(.title2)
                    .bold()
                }
                
                Section {
                    TextField("Full name", text: $fullName)
                    #if os(iOS)
                        .textContentType(.name)
                    #endif
                    TextField("City", text: $city)
                    #if os(iOS)
                        .textContentType(.addressCity)
                    #endif
                    TextField("Zip code", text: $zipCode)
                    #if os(iOS)
                        .textContentType(.postalCode)
                        .keyboardType(.numberPad)
                    #endif
                    TextField("Street Address", text: $streetAddress)
                    #if os(iOS)
                        .textContentType(.fullStreetAddress)
                        .submitLabel(.done)
                    #endif
                }
                .disableAutocorrection(true)
                
                Section {
                    NavigationLink(destination: CheckoutReview()) {
                        Text("Submit")
                            .foregroundColor(Color.accentColor)
                    }
                    .disabled(isDisabled)
                }
            }
            .navigationTitle("Checkout")
            #if os(iOS)
            .navigationBarItems(trailing: Button("Cancel") { presentationMode.wrappedValue.dismiss() })
            #endif
        }
    }
}

extension LocalizedStringKey: Hashable {
    public func hash(into hasher: inout Hasher) {
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
