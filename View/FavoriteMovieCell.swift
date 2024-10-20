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
            AsyncImage(url: URL(string: movie.Poster ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 180)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180)
                        .background(Color.gray)
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(8)
            
            Text(movie.Title ?? "No Title")
                .font(.caption)
                .foregroundColor(.white)
                .lineLimit(1)
        }
        .background(Color.black.opacity(0.7))
        .cornerRadius(12)
        .padding(4)
    }
}
