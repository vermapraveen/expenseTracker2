//
//  AddVisiterView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/26/23.
//

import SwiftUI

struct AddVisiterView: View {
    @ObservedObject var viewModel: VisiterViewModel
    @Binding var isPresented: Bool
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add Visiter")
            .navigationBarItems(leading: Button("Cancel", action: {
                isPresented = false
            }), trailing: Button("Add", action: {
                viewModel.addVisiter(name: name)
                isPresented = false
            }))
        }
    }
}

