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
            VStack {
                List {
                    ForEach(test) { person in
                      HStack {
                        Text(person.name)
                        
                      }
                    }
                    .onDelete(perform: onDelete)
                }
                NavigationLink (destination: ItemView()) {
                    Text("Next")
                        .foregroundColor(Color.white)
                        .fontWeight(.light)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                
            }
            .navigationBarTitle("Split a Bill")//"Split a Bill")
            .navigationBarItems(trailing: EditButton())
            .environment(\.editMode, $editMode)
        
        }
        
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
