//
//  SeasonalApp.swift
//  Seasonal
//
//  Created by Lily Z on 5/21/26.
//

import SwiftUI
import CoreData

@main
struct SeasonalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
