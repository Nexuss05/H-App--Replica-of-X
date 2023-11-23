//
//  NC1_XApp.swift
//  NC1-X
//
//  Created by Matteo Cotena on 14/11/23.
//

import SwiftUI
import SwiftData

@main
struct NC1_XApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            FirstScreen()
                .modelContainer(for: [Tweet.self])
                .environment(\.accessibilityEnabled, true)
//            Twitt()
//                .modelContainer(for: [Tweet.self])
        }
//        .modelContainer(sharedModelContainer)
    }
}
