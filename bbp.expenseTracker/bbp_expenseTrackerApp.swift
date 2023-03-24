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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
