//
//  UnitTypeViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Combine
import SwiftUI

class UnitTypeViewModel: ObservableObject {
    @Published var UnitTypes: [UnitType] = [
        UnitType(name: "Mile"),
        UnitType(name: "Kilogram"),
        UnitType(name: "Pound"),
        UnitType(name: "Dozen"),
        UnitType(name: "Gram"),
        UnitType(name: "Day"),
        UnitType(name: "Six Monthly"),
        UnitType(name: "Yearly"),
        UnitType(name: "Monthly")
    ]

    func addUnitType(name: String) {
        let newUnitType = UnitType(name: name)
        UnitTypes.append(newUnitType)
    }

    func updateUnitType(UnitType: UnitType, newName: String) {
        if let index = UnitTypes.firstIndex(of: UnitType) {
            UnitTypes[index].name = newName
        }
    }

    func removeUnitType(UnitType: UnitType) {
        UnitTypes.removeAll { $0 == UnitType }
    }
}
