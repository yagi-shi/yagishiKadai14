import SwiftUI

struct ContentView: View {
    @State var isShowModal = false
    @State var fruits: [(name: String, isSelected: Bool)] = [
        (name: "りんご", isSelected: false),
        (name: "みかん", isSelected: true),
        (name: "バナナ", isSelected: false),
        (name: "パイナップル", isSelected: true)
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach($fruits, id: \.name) { $fruit in
                    HStack {
                        if fruit.isSelected {
                            Image(systemName: "checkmark")
                                .foregroundColor(.orange)
                        } else {
                            Image(systemName: "checkmark")
                                .hidden()
                        }
                        Text(fruit.name)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            // navigationBarItemsでも書けるようだが、SwiftUI 2.0以降では非推奨。
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("+") {
                        isShowModal = true
                    }
                    .fullScreenCover(isPresented: $isShowModal) {
                        ModalView(onSave: {
                            fruits.append((name: $0, isSelected: false))
                        })
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
