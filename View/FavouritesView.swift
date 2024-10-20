//
//  SearchView.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//
import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesManager = FavoritesManager.shared

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                    ForEach(favoritesManager.favorites) { movie in
                        MovieCellView(movie: movie)
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
        }
    }
}
