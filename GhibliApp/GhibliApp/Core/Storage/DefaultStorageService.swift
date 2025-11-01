//
//  DefaultStorageService.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import Foundation
import SwiftData

struct DefaultStorageService {
    let modelContext: ModelContext
    
    func load() -> Set<String> {
        let descriptor = FetchDescriptor<Favourite>()
        
        do {
            let favourites = try modelContext.fetch(descriptor)
            return Set(favourites.map{$0.filmID})
        } catch {
            print("Failed to load favourites: \(error)")
            return[]
        }
    }
    
    func save(favouriteIDs: Set<String>){
        do {
            let descriptor = FetchDescriptor<Favourite>()
            let existing = try modelContext.fetch(descriptor)
            
            let existingIDs = Set(existing.map{$0.filmID})
            
            for favourite in existing where !favouriteIDs.contains(favourite.filmID){
                modelContext.delete(favourite)
            }
            
            let newIDs = favouriteIDs.subtracting(existingIDs)
            for id in newIDs {
                modelContext.insert(Favourite(filmID: id))
            }
            
            try modelContext.save()
        }catch {
            print("Failed to save favourites: \(error)")
        }
    }
}
