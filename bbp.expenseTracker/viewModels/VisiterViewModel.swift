//
//  VisiterViewModel.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import Combine
import SwiftUI

class VisiterViewModel: ObservableObject {
    @Published var visiters: [Visiter] = [
        Visiter(name: "Praveen"),
        Visiter(name: "Divya"),
        Visiter(name: "Sanchay"),
        Visiter(name: "Others")
    ]

    func addVisiter(name: String) {
        let newVisiter = Visiter(name: name)
        visiters.append(newVisiter)
    }

    func updateVisiter(visiter: Visiter, newName: String) {
        if let index = visiters.firstIndex(of: visiter) {
            visiters[index].name = newName
        }
    }

    func removeVisiter(visiter: Visiter) {
        visiters.removeAll { $0 == visiter }
    }
}
