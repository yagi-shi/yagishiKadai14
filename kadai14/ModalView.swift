import SwiftUI

struct ModalView: View {
    @Binding var fruits: [(name: String, isSelected: Bool)]
    @State var newFruit: String
    @Environment (\.presentationMode) var presentaionMode

    var body: some View {
        NavigationStack {
            HStack {
                Text("名前")
                TextField("", text: $newFruit)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            }
            .offset(x: 0, y: 50)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        presentaionMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if !newFruit.isEmpty {
                            fruits.append((name: newFruit, isSelected: false))
                            presentaionMode.wrappedValue.dismiss()
                        } else {
                            presentaionMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
                Spacer(minLength: 50)
        }
    }
}
