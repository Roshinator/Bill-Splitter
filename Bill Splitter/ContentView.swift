//
//  ContentView.swift
//  Bill Splitter
//
//  Created by Roshan Sevalia on 8/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var editMode: EditMode = EditMode.inactive
    @State var Placeholder: String = "Placed"
  
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
                  HStack {
                    
                    Text(person.name)
                    
                    Spacer()
  
                    Image(systemName: "arrow.left")
                      .foregroundColor(.red)
                  }
                }
                .onDelete(perform: onDelete)
                HStack {
                  Button(action: {
                    test.append(Person(name: Placeholder))
                  }, label: {
                    Label("", systemImage: "plus.circle.fill").accentColor(.green)
                  })
                  TextField("LocalizedStringKey", text: $Placeholder)
                }
              
//                Button(action: {() -> Void in return}) {
//                    Label("Thing", systemImage: "plus.circle.fill").accentColor(.green)
//                }
            }
            .navigationBarTitle("Split a Bill")//"Split a Bill")
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
