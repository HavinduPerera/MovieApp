//
//  FilmsScreen.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import SwiftUI

struct FimsScreen: View {
    let filmsViewModel: FilmsViewModel
    let favouritesViewModel: FavouritesViewModel
    
    var body: some View {
        NavigationStack{
            Group{
                switch filmsViewModel.state {
                case .idle:
                    Text("No Films yet")
                    
                case .loading:
                    ProgressView{
                        Text("Loading...")
                    }
                    
                case .loaded(let films):
                    FilmListView(films: films, favouritesViewModel: favouritesViewModel)
                    
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}
