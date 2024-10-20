//
//  SearchView.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: MoviesViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for movies", text: $searchText, onCommit: {
                    viewModel.fetchMovies(query: searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                List(viewModel.movies) { movie in
                    Text(movie.Title ?? "Unknown Title")
                }
            }
            .navigationTitle("Search")
        }
    }
}
