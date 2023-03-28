//
//  bbp_expenseTrackerApp.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/24/23.
//

import SwiftUI

@main
struct bbp_expenseTrackerApp: App {
    let persistenceController = PersistenceController.shared
    @State private var selection = 1
    @StateObject var storeViewModel = StoreViewModel()
    @StateObject var visiterViewModel = VisiterViewModel()

    var body: some Scene {
        WindowGroup {
            TabView(selection:$selection){
                ShoppingListView().tabItem{Label("Shopping List", systemImage: "checklist")}.tag(1)
                ContentView().tabItem{ Label("Expenses", systemImage: "dollarsign")}.tag(2)
                StoreVisitView(storeViewModel: storeViewModel, visiterViewModel: visiterViewModel).tabItem{Label("Visit", systemImage: "cart")}.tag(3)
                
                SettingsView().tabItem{Label("Settings", systemImage: "gear")}.tag(4)
            }
        }
    }
}
