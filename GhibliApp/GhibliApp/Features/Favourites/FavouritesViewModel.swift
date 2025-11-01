//
//  FavouritesViewModel.swift
//  GhibliApp
//
//  Created by Havindu Perera on 2025-11-01.
//

import Foundation
import Observation
import SwiftData

@Observable
class FavouritesViewModel {
    private(set) var favouriteIDs: Set<String> = []
    private var service: DefaultStorageService?
    
    init(service: DefaultStorageService? = nil){
        self.service = service
    }
    
    func configure(modelContext: ModelContext){
        guard service == nil else { return }
        service = DefaultStorageService(modelContext: modelContext)
        load()
    }
    
    func load(){
        guard let service = service else {
            favouriteIDs = []
            return
        }
        favouriteIDs = service.load()
    }
    
    func toggleFavourite(filmID: String){
        if favouriteIDs.contains(filmID){
            favouriteIDs.remove(filmID)
        } else {
            favouriteIDs.insert(filmID)
        }
        
        save()
    }
    
    private func save() {
        service?.save(favouriteIDs: favouriteIDs)
    }
    
    func isFavourite(filmID: String) -> Bool {
        favouriteIDs.contains(filmID)
    }
}
