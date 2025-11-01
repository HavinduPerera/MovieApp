//
//  FavouriteButton.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import SwiftUI

struct FavouriteButton: View {
    let filmID: String
    let favouritesViewModel: FavouritesViewModel
    
    var isFavourite: Bool {
        favouritesViewModel.isFavourite(filmID: filmID)
    }
    
    var body: some View {
        Button{
            favouritesViewModel.toggleFavourite(filmID: filmID)
        } label: {
            Image(systemName: isFavourite ? "heart.fill" : "heart")
                .foregroundStyle(isFavourite ? Color.pink : Color.gray)
        }
    }
}
