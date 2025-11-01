//
//  ContentView.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var filmsViewModel = FilmsViewModel()
    @State private var favouritesViewModel = FavouritesViewModel()
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView {
            Tab("Movies", systemImage: "movieclapper"){
                FimsScreen(filmsViewModel: filmsViewModel, favouritesViewModel: favouritesViewModel)
            }
            
            Tab ("Favourites", systemImage: "heart"){
                FavouritesScreen(filmsViewModel: filmsViewModel, favouritesViewModel: favouritesViewModel)
            }
        }
        .task {
            favouritesViewModel.configure(modelContext: modelContext)
            await filmsViewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
