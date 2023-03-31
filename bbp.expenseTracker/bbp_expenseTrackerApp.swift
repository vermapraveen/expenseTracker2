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
    @State private var selectedTab = 1
    @StateObject var storeViewModel = StoreViewModel()
    @StateObject var visiterViewModel = VisiterViewModel()
    
    @StateObject private var lastVisitAPI = LastVisitAPI()
    @State private var lastVisitId = UUID()
    
    var body: some Scene {
        WindowGroup {
                TabView(selection: $selectedTab){
                    ShoppingListView().tabItem{Label("Shopping List", systemImage: "checklist")}.tag(1)
                    ExpensesView(visitId: lastVisitId).tabItem{ Label("Expenses", systemImage: "dollarsign")}.tag(2)
                    StoreVisitView(storeViewModel: storeViewModel, visiterViewModel: visiterViewModel, selectedTab: $selectedTab).tabItem{Label("Store Visit", systemImage: "cart")}.tag(3)
                    
                    SettingsView().tabItem{Label("Settings", systemImage: "gear")}.tag(4)
                }
        }
    }
}
