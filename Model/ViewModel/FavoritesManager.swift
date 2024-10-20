//
//  FavouritesManagaer.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//
import Foundation

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()
    @Published var favorites: [Movie] = []

    func addFavorite(_ movie: Movie) {
        if !favorites.contains(where: { $0.id == movie.id }) {
            favorites.append(movie)
        }
    }

    func removeFavorite(_ movie: Movie) {
        favorites.removeAll { $0.id == movie.id }
    }

    func isFavorite(_ movie: Movie) -> Bool {
        favorites.contains(where: { $0.id == movie.id })
    }

    func getFavorites() -> [Movie] {
        return favorites
    }
}
