//
//  DataItem.swift
//  SwiftData_Demo2
//
//  Created by Rakhyun Kim on 11/21/23.
//

import Foundation
import SwiftData

@Model
class Person: Identifiable {
    
    var id: String
    var age: Int = 0
    var name: String = ""
    
    init() {
        id = UUID().uuidString
    }
}
