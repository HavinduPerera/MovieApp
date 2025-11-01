//
//  FilmListView.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import SwiftUI

struct FilmListView: View {
    var films: [Film]
    let favouritesViewModel: FavouritesViewModel
    
    var body: some View {
        List(films) { film in
            NavigationLink(value: film) {
                FilmRow(film: film, favouritesViewModel: FavouritesViewModel())
            }
        }
        .navigationDestination(for: Film.self) { film in
            FilmDetailScreen(film: film,
                             favouritesViewModel: favouritesViewModel)
        }
    }
}

private struct FilmRow: View {
    let film : Film
    let favouritesViewModel: FavouritesViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            FilmsImageView(urlPath: film.image)
                .frame(width: 100, height: 150)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(film.title)
                    .bold()
                
                Text("Directed by \(film.director)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Released: \(film.releaseYear)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                FavouriteButton(filmID: film.id, favouritesViewModel: favouritesViewModel)
                    .buttonStyle(.plain)
                    .controlSize(.large)
            }
            .padding()
        }
    }
}
