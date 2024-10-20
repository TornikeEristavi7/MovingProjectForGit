//
//  SearchView.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//
import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var movies: [Movie] = []

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for movies", text: $searchText, onCommit: {
                    searchMovies(query: searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                List(movies) { movie in
                    MovieCellView(movie: movie)
                }
            }
            .navigationTitle("Search")
            .background(Color(white: 0.1).edgesIgnoringSafeArea(.all))
        }
    }

    private func searchMovies(query: String) {
        let getData = GetData()
        getData.fetchMovies(query: query, page: 1) { fetchedMovies in
            self.movies = fetchedMovies
        }
    }
}
