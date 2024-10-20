//
//  MovieCellView.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import SwiftUI

struct MovieCellView: View {
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

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMovie = Movie(
            id: "1",
            Title: "Inception",
            Year: "2010",
            Runtime: "148 min",
            Genre: "Action, Sci-Fi",
            Poster: "https://image.tmdb.org/t/p/w500/8c0sIoVxZIT1hDD4n78vT7rZ2rD.jpg",
            Plot: "A skilled thief is given a chance at redemption if he can successfully plant an idea into a target's mind.",
            rating: "8.8"
        )
        MovieCellView(movie: sampleMovie)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
