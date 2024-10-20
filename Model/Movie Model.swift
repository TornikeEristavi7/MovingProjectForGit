//
//  nameshouldchange.swift
//  MovingProject
//
//  Created by Tornike Eristavi on 17.10.24.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: String
    let Title: String?
    let Year: String?
    let Runtime: String?
    let Genre: String?
    let Poster: String?
    let Plot: String?
    let rating: String?

    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case Title, Year, Runtime, Genre, Poster, Plot, rating
    }
}

struct MovieResponse: Codable {
    let Search: [Movie]
}


