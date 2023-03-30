//
//  StoreVisitViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/30/23.
//

import SwiftUI
import Combine

class StoreVisitViewModel: ObservableObject {
    @Published var storeVisits: [StoreVisit] = [
        StoreVisit(id: UUID(), storeName: "Store 1", visitors: [Visiter(id: UUID(), name: "Praveen")], paymentAmount: 150.0, paymentMethod: "Cash", checkInDate: Date(), checkInTime: Date()),
        StoreVisit(id: UUID(), storeName: "Store 2", visitors: [Visiter(id: UUID(), name: "Divya"), Visiter(id: UUID(), name: "Sanchay")], paymentAmount: 250.0, paymentMethod: "Credit Card", checkInDate: Date(), checkInTime: Date())
    ]
}

