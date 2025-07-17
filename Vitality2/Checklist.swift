
//
// ContentView.swift
// Test app
//
// Created by Scholar on 7/16/25.
//
import SwiftUI
// Checklist item model
struct ChecklistItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}
@Observable
class ChecklistModel {
    var items: [ChecklistItem] = [
        ChecklistItem(title: "Do something that makes you smile!", isCompleted: false),
        ChecklistItem(title: "Take a 5 minute mindfulness walk", isCompleted: true),
        ChecklistItem(title: "Make your bed", isCompleted: true),
        ChecklistItem(title: "Drink a glass of water", isCompleted: false)
    ]
}
struct Checklist: View {
    @State private var model = ChecklistModel()
    @State private var newItemTitle: String = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(model.items) { item in
                        HStack {
                            Button {
                                toggleCompletion(for: item)
                            } label: {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                            }
                            TextField("Edit Item", text: binding(for: item))
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
                HStack {
                    TextField("New item", text: $newItemTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add") {
                        addNewItem()
                    }
                }
                .padding()
            }
            .navigationTitle("Morning Routine")
            .toolbar {
                EditButton()
            }
        }
    }
    // MARK: - Functions
    func toggleCompletion(for item: ChecklistItem) {
        if let index = model.items.firstIndex(where: { $0.id == item.id }) {
            model.items[index].isCompleted.toggle()
        }
    }
    func deleteItem(at offsets: IndexSet) {
        model.items.remove(atOffsets: offsets)
    }
    func moveItem(from source: IndexSet, to destination: Int) {
        model.items.move(fromOffsets: source, toOffset: destination)
    }
    func addNewItem() {
        guard !newItemTitle.isEmpty else { return }
        let newItem = ChecklistItem(title: newItemTitle, isCompleted: false)
        model.items.append(newItem)
        newItemTitle = ""
    }
    private func binding(for item: ChecklistItem) -> Binding<String> {
        guard let index = model.items.firstIndex(where: { $0.id == item.id }) else {
            fatalError("Item not found")
        }
        return $model.items[index].title
    }
}
// Preview
#Preview {
    ContentView()
}

