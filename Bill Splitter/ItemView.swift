//
//  ItemView.swift
//  Bill Splitter
//
//  Created by Roshan Sevalia on 9/4/21.
//

import SwiftUI

struct ItemView: View {
    
    @State private var showSheet = false;
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                    Button(action: AddItem) {
                        Text("Add Item")
                            .foregroundColor(Color.white)
                            .fontWeight(.light)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .sheet(isPresented: $showSheet, content: {
                                CostPersonInputForm()
                            })
                    }
                }
            }
                
            .navigationBarTitle("Add Items")
        }
    }
    
    private func AddItem() {
        showSheet = true
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
