//
//  StoreViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Combine
import SwiftUI

class StoreViewModel: ObservableObject {
    @Published var Stores: [Store] = [
        Store(name: "HEB"),
        Store(name: "Costco"),
        Store(name: "Amazon"),
        Store(name: "PEC"),
        Store(name: "City Of Leander"),
        Store(name: "Sanchay School")
    ]

    func addStore(name: String) {
        let newStore = Store(name: name)
        Stores.append(newStore)
    }

    func updateStore(Store: Store, newName: String) {
        if let index = Stores.firstIndex(of: Store) {
            Stores[index].name = newName
        }
    }

    func removeStore(Store: Store) {
        Stores.removeAll { $0 == Store }
    }
}
