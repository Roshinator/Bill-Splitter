//
//  ContentView.swift
//  Bill Splitter
//
//  Created by Roshan Sevalia on 8/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var editMode: EditMode = EditMode.inactive
    
    struct Person: Identifiable {
        let id = UUID()
        let name: String
    }
    @State var test =
    [
        Person(name: "Shravan"),
        Person(name: "Dom"),
        Person(name: "Isaac"),
        Person(name: "Roshan")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(test) { person in
                    Text(person.name)
                }
                .onDelete(perform: onDelete)
                
//                Button(action: {() -> Void in return}) {
//                    Label("Thing", systemImage: "plus.circle.fill").accentColor(.green)
//                }
            }
            .navigationBarTitle("Split a Bill")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
        }
    }
    
    private var addButton: some View {
        return AnyView(
            Button(action: onAdd) {
                    Image(systemName: "plus")
                
            })
    }
    
    private func onDelete(offsets: IndexSet) {
        test.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
            test.move(fromOffsets: source, toOffset: destination)
    }
    
    private func onAdd() {
        test.append(Person(name: "This is a thing"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
