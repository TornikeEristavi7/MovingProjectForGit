//
//  ModelView.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import SwiftUI

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    func fetchMovies(query: String) {
        let getData = GetData()
        getData.fetchMovies(query: query, page: 1) { fetchedMovies in
            self.movies = fetchedMovies
        }
    }
}

