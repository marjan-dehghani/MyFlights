//
//  MyFlightsApp.swift
//  MyFlights
//
//  Created by Marjan on 3/25/1400 AP.
//

import SwiftUI
import CoreData

@main
struct MyFlightsApp: App {
    
    let persistence = PersistenceManager()
        
    var body: some Scene {
        WindowGroup {
            FlightSuggestionsView(store: FlightSuggestionStore(context: persistence.persistentContainer.viewContext))
        }
    }
}
