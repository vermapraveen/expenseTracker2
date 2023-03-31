//
//  Visiter.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Foundation

struct Visiter: Identifiable, Equatable, Hashable, Decodable {
    var id = UUID()
    var name: String
}
