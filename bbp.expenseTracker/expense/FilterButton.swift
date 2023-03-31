//
//  FilterButton.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/31/23.
//

import SwiftUI

struct FilterButton: View {
    @Binding var filterApplied: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
            filterApplied.toggle()
        }) {
            HStack {
                Image(systemName: "line.horizontal.3.decrease.circle")
                Text("Filter")
                    .fontWeight(.bold)
            }
            .padding(8)
            .foregroundColor(.white)
            .background(filterApplied ? Color.green : Color.blue)
            .cornerRadius(8)
        }
    }
}

