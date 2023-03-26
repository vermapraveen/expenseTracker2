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
                NavigationLink(destination: Text("Payment Type")) {
                    Text("Payment Type")
                }
                // Replace the existing Visiter row in the SettingsView List with the following:
                NavigationLink(destination: VisiterView()) {
                    Text("Visiter")
                }

                NavigationLink(destination: Text("Store")) {
                    Text("Store")
                }
                NavigationLink(destination: Text("Unit Type")) {
                    Text("Unit Type")
                }
                NavigationLink(destination: Text("Item Type")) {
                    Text("Item Type")
                }
                NavigationLink(destination: Text("Category")) {
                    Text("Category")
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}
