//
//  PaymentTypeViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Combine
import SwiftUI

class PaymentTypeViewModel: ObservableObject {
    @Published var PaymentTypes: [PaymentType] = [
        PaymentType(name: "Cash"),
        PaymentType(name: "Cashback"),
        PaymentType(name: "Coupon"),
        PaymentType(name: "Monthly Debit"),
        PaymentType(name: "Praveen Apple"),
        PaymentType(name: "Divya Apple"),
        PaymentType(name: "Praveen Discover"),
        PaymentType(name: "Praveen Citi")
    ]

    func addPaymentType(name: String) {
        let newPaymentType = PaymentType(name: name)
        PaymentTypes.append(newPaymentType)
    }

    func updatePaymentType(PaymentType: PaymentType, newName: String) {
        if let index = PaymentTypes.firstIndex(of: PaymentType) {
            PaymentTypes[index].name = newName
        }
    }

    func removePaymentType(PaymentType: PaymentType) {
        PaymentTypes.removeAll { $0 == PaymentType }
    }
}
