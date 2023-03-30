//
//  StoreVisit.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/30/23.
//

import Foundation

struct StoreVisit: Identifiable {
    let id: UUID
    let storeName: String
    let visitors: [Visiter]
    let paymentAmount: Double
    let paymentMethod: String
    let checkInDate: Date
    let checkInTime: Date
}
