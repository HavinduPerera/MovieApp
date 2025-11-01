//
//  FavouritesScreen.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import SwiftUI

struct FavouritesScreen: View {
    let filmsViewModel: FilmsViewModel
    let favouritesViewModel: FavouritesViewModel
    
    var films: [Film] {
        let favourites = favouritesViewModel.favouriteIDs
        
        switch filmsViewModel.state {
        case .loaded(let films):
            return films.filter{favourites.contains($0.id)}
        default:
            return []
        }
    }
    
    var body: some View {
        NavigationStack {
            Group{
                if films.isEmpty {
                    ContentUnavailableView("No Favourites yet", systemImage: "heart")
                } else {
                    FilmListView(films: films, favouritesViewModel: favouritesViewModel)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
