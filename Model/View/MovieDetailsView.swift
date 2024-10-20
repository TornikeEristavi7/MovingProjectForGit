//
//  MovieDetailsView.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import SwiftUI

struct MovieDetailView: View {
    @State private var movie: Movie?
    @State private var isFavorite = false
    var movieID: String

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let movie = movie {
                    AsyncImage(url: URL(string: movie.Poster ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 300)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .background(Color.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ratingView(rating: movie.rating ?? "N/A")
                                    .padding(.trailing, 20)
                            }
                        }
                    )

                    HStack(alignment: .top, spacing: 16) {
                        AsyncImage(url: URL(string: movie.Poster ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 100)
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.white, lineWidth: 1.5)
                                )
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 100)
                                .background(Color.gray)
                        }

                        VStack(alignment: .leading) {
                            Text(movie.Title ?? "No Title")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .lineLimit(2)
                            
                            movieDetailsView(movie: movie)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    aboutMovieSection(movie: movie)
                    
                    Text(movie.Plot ?? "No description available")
                        .foregroundColor(Color(white: 0.8))
                        .font(.system(size: 12))
                        .padding(.horizontal)
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear {
            fetchMovieDetails()
        }
    }
    
    private func fetchMovieDetails() {
        GetData().fetchMovieDetails(byID: movieID) { fetchedMovie in
            if let fetchedMovie = fetchedMovie {
                self.movie = fetchedMovie
                self.isFavorite = FavoritesManager.shared.isFavorite(fetchedMovie)
            } else {
                print("Failed to fetch movie details")
            }
        }
    }
    
    private func movieDetailsView(movie: Movie) -> some View {
        HStack {
            if let year = movie.Year {
                Label(year, systemImage: "calendar")
                    .foregroundColor(.white)
            }
            if let runtime = movie.Runtime {
                Label(runtime, systemImage: "clock")
                    .foregroundColor(.white)
            }
            if let genre = movie.Genre {
                Label(genre, systemImage: "ticket")
                    .foregroundColor(.white)
            }
        }
        .font(.system(size: 12))
    }
    
    private func aboutMovieSection(movie: Movie) -> some View {
        HStack {
            Text("About Movie")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: {
                toggleFavorite(movie: movie)
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .white)
            }
        }
        .padding()
        .background(Color(white: 0.1))
        .cornerRadius(6)
        .padding(.horizontal)
    }
    
    private func ratingView(rating: String) -> some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.orange)
            Text(rating)
                .foregroundColor(.orange)
                .font(.system(size: 12, weight: .bold))
        }
        .padding(6)
        .background(Color(white: 0.1, opacity: 0.7))
        .cornerRadius(10)
    }
    
    private func toggleFavorite(movie: Movie) {
        if isFavorite {
            FavoritesManager.shared.removeFavorite(movie)
        } else {
            FavoritesManager.shared.addFavorite(movie)
        }
        isFavorite.toggle()
    }
}
