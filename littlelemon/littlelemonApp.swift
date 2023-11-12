//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Rıdvan on 8.11.2023.
//

import SwiftUI

@main
struct littlelemonApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Onboarding()
                .preferredColorScheme(.light)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
