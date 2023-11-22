//
//  ContentView.swift
//  SwiftData_Demo2
//
//  Created by Rakhyun Kim on 11/21/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var nameText = ""
    @State private var ageText = ""
    
    @State private var pickerSelection: PickerType = .kids
    

    var body: some View {
        VStack {
           
            Picker("Type", selection: $pickerSelection) {
                Text("Kids")
                    .tag(PickerType.kids)
                Text("Adults")
                    .tag(PickerType.adults)
            }
            .pickerStyle(.segmented)
            
            PeopleListView(filter: pickerSelection)
            
            HStack {
                TextField("Name", text: $nameText)
                TextField("Age", text: $ageText)
                Button("Add") {
//                    let data = people
//                    context.insert(data)
                    let data = Person()
                    data.age = Int(ageText)!
                    data.name = nameText
                    context.insert(data)
                    
                    ageText = ""
                    nameText = ""
                }
                
            }
            .textFieldStyle(.roundedBorder)
            
        }
        .padding()
    }
}
enum PickerType {
    case kids
    case adults
}

#Preview {
    ContentView()
}
