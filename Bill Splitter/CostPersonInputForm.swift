//
//  CostPersonInputForm.swift
//  Bill Splitter
//
//  Created by Roshan Sevalia on 9/4/21.
//

import SwiftUI

struct CostPersonInputForm: View {
    enum Test{
        case Wow
        case Thing
        case OtherThing
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State var selection : Test = Test.Wow
    @State var person = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Text")) {
                    Toggle(isOn: $person, label: {Text("Person?")})
                        .toggleStyle(CheckboxStyle())
                }
            }
            .navigationBarTitle("Input Parameters")
            .navigationBarItems(trailing: saveButton)
        }
    }
    
    var saveButton : some View {
        Button("Save", action: {() -> Void in
            presentationMode.wrappedValue.dismiss()
        })
    }
}

struct CheckboxStyle: ToggleStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
 
        return Button(action:{() -> Void in configuration.isOn.toggle()}) {
            HStack {
                configuration.label
                    .foregroundColor(.black)
     
                Spacer()
     
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                    .font(.system(size: 20, design: .default))
            }
        }
 
    }
}

struct CostPersonInputForm_Previews: PreviewProvider {
    static var previews: some View {
        CostPersonInputForm()
    }
}
