import SwiftUI

struct ModalView: View {
    @State var newFruit: String = ""
    @Environment (\.presentationMode) var presentationMode
    var onSave: (String) -> Void

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
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if !newFruit.isEmpty {
                            onSave(newFruit)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }

            Spacer(minLength: 50)
        }
    }
}
