import SwiftUI

struct MultiSelectPicker<SelectionValue: Identifiable & Hashable>: View {
    var label: String
    var options: [SelectionValue]
    @Binding var selection: Set<SelectionValue>
    var labelForSelection: (SelectionValue) -> String

    @State private var presented = false

    var body: some View {
        Button(action: { presented.toggle() }) {
            HStack {
                Text(label)
                Spacer()
                Text(selection.map(labelForSelection).joined(separator: ", "))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .sheet(isPresented: $presented) {
            NavigationView {
                List(options, id: \.self, selection: $selection) { option in
                    Text(labelForSelection(option))
                }
                .navigationBarTitle(Text(label), displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            presented = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            presented = false
                        }
                    }
                }
            }
        }
    }
}
