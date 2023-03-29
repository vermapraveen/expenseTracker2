//
//  PaymentType.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Foundation

struct PaymentType: Identifiable, Equatable, Hashable {
    var id = UUID()
    var name: String
}
