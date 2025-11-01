//
//  GhibliAppApp.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import SwiftUI
import SwiftData

@main
struct GhibliAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Favourite.self)
        }
    }
}
