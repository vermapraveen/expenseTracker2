//
//  PaymentTypeViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Combine
import SwiftUI

class PaymentTypeViewModel: ObservableObject {
    @Published var paymentTypes: [PaymentType] = []

        init() {
            let dummyData = [
                PaymentType(id: UUID(), name: "Cash"),
                PaymentType(id: UUID(), name: "Credit Card"),
                PaymentType(id: UUID(), name: "Debit Card"),
                PaymentType(id: UUID(), name: "Mobile Payment")
            ]
            self.paymentTypes = dummyData
        }

    func addPaymentType(name: String) {
        let newPaymentType = PaymentType(name: name)
        paymentTypes.append(newPaymentType)
    }

    func updatePaymentType(PaymentType: PaymentType, newName: String) {
        if let index = paymentTypes.firstIndex(of: PaymentType) {
            paymentTypes[index].name = newName
        }
    }

    func removePaymentType(PaymentType: PaymentType) {
        paymentTypes.removeAll { $0 == PaymentType }
    }
}
