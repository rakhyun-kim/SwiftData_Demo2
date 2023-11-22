//
//  SwiftData_Demo2App.swift
//  SwiftData_Demo2
//
//  Created by Rakhyun Kim on 11/21/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_Demo2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Person.self)
                
        }
    }
}
