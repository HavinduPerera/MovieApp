//
//  ContentView.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import SwiftUI

struct ContentView: View {
    @State private var filmsViewModel = FilmsViewModel()
    
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
                    ForEach(films) { film in
                        Text(film.title)
                    }
                    
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .task {
                await filmsViewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}
