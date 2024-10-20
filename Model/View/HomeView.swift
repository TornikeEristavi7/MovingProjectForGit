//
//  HomeView.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = MoviesViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieID: movie.id)) {
                            MovieCellView(movie: movie)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Movies")
        }
        .onAppear {
            viewModel.fetchMovies(query: "Avengers") 
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

