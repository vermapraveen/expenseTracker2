//
//  ShoppingListItemView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import SwiftUI

struct ShoppingListItemView: View {
    @ObservedObject var viewModel: ShoppingListViewModel
    var item: ShoppingListItem

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(item.name) {\(item.brand)} --------\(item.quantity) [\(item.urgency)]")
        }
    }
}			
