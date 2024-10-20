//
//  FavoriteMovieCell.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import SwiftUI

struct FavoriteMovieCell: View {
    let movie: Movie

    var body: some View {
        VStack {
            if let posterURL = movie.Poster, let url = URL(string: posterURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .clipped()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .background(Color.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .background(Color.gray)
            }

            Text(movie.Title ?? "Unknown Title")
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(.top, 5)

            if let year = movie.Year {
                Text(year)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.black.opacity(0.7))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        .padding(.horizontal)
    }
}
