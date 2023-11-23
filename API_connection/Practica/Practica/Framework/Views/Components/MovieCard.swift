//
//  MovieCard.swift
//  Practica
//
//  Created by Ramona NF on 22/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        VStack (spacing: 8) {
            Text(movie.original_title)
                .font(.title2)
            
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + movie.poster_path))
                .resizable()
                .cornerRadius(8)
                .scaledToFit()
            
            HStack (spacing: 2) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .cornerRadius(2)
                    .frame(height: 0.5)
                
                Text("\(movie.popularity)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text(movie.release_date)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .frame(alignment: .trailing)
            }.padding([.leading, .trailing],8)
            
            Divider()
            
            Text(movie.overview)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.padding()
         .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
         ).padding(6)
    }
}

struct MovieCard_Preview: PreviewProvider {
    static var previews: some View {
        let movieInfo:Movie = Movie(id: 1234, backdrop_path: "", poster_path: "https://www.leagueoflegends.com/static/open-graph-b580f0266cc3f0589d0dc10765bc1631.jpg" ,title: "Title", original_title: "Original title", original_language: "es", overview: "Description", popularity: 8.8, release_date: "2023/11/22", video: false, adult: true, genre_ids: [1, 2, 3], vote_average: 109.65, vote_count: 13)
        
        MovieCard(movie: movieInfo)
    }
}
