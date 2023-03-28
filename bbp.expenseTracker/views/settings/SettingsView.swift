//
//  SettingsView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PaymentTypeView()) {
                    Text("Payment Type")
                }
                // Replace the existing Visiter row in the SettingsView List with the following:
                NavigationLink(destination: VisiterView()) {
                    Text("Visiter")
                }

                NavigationLink(destination: StoreView()) {
                    Text("Store")
                }
                NavigationLink(destination: UnitTypeView()) {
                    Text("Unit Type")
                }
                NavigationLink(destination: ItemTypeView()) {
                    Text("Item Type")
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}
