//
//  Favourite.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import Foundation
import SwiftData

@Model
final class Favourite {
    @Attribute(.unique) var filmID: String
    
    init(filmID: String) {
        self.filmID = filmID
    }
}
