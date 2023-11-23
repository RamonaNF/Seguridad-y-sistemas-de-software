//
//  Content.swift
//  Practica
//
//  Created by Ramona NF on 22/11/23.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id: Int
    
    var backdrop_path: String
    var poster_path: String
    
    var title: String
    var original_title: String
    var original_language: String
    
    var overview: String
    var popularity: Double
    var release_date: String
    
    var video: Bool
    var adult: Bool
    var genre_ids: [Int]
    var vote_average: Double
    var vote_count: Int
}

struct MovieResponse: Codable {
    var page: Int
    var results: [Movie]
}
