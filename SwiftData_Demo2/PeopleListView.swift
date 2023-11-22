//
//  PeopleListView.swift
//  SwiftData_Demo2
//
//  Created by Rakhyun Kim on 11/21/23.
//

import SwiftUI
import SwiftData

struct PeopleListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(filter: #Predicate<Person> { people in
        people.age < 20
    }, sort: \Person.age, order: .forward) private var people: [Person]
    
    var body: some View {
        VStack {
            List(people) { p in
                HStack {
                    Text(p.name)
                    Text("Age: \(String(p.age))")
                }
                .swipeActions {
                    Button("Del") {
                        context.delete(p)
                    }
                }
            }
        }

    }
    init(filter: PickerType) {
        // Set a type of PickerType from enum,
        // list over 20 years in adults, below 20years in kids
//        let babo = Person() 
//            babo.age < 20 =  PickerType.kids
//            babo.age >= 20 = PickerType.adults
        if filter == PickerType.kids {
            _people = Query(filter: #Predicate<Person> { people in
                people.age < 20
            })
            } else if filter == PickerType.adults {
                _people = Query(filter: #Predicate<Person> { people in
                    people.age >= 20
                })
            }
    }
}
