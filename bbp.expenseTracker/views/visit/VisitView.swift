//
//  VisitView.swift
//  bbp.expenseTracker
//
//  Created by Praveen K Verma on 3/25/23.
//

import SwiftUI

struct VisitView: View {
    var body: some View {
        VStack {
            Label("Add", systemImage: "plus")
                 .frame(width: 60, height: 60)
                 .foregroundColor(.blue)
            Text("Select Store")
                .font(.title)

            HStack{
                HStack{
                    Button(action: addItem) {
                        Label("            ", systemImage: "figure.walk.arrival")
                            .foregroundColor(.green)
                    }
                    Button(action: addItem) {
                        Label("", systemImage: "figure.walk.departure")
                            .foregroundColor(.red)
                    }
                }.frame(maxHeight: .infinity, alignment: .bottom)
            }
         }

    }
    private func addItem() {
        
    }
}

struct VisitView_Previews: PreviewProvider {
    static var previews: some View {
        VisitView()
    }
}
