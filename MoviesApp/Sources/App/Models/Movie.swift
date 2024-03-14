//
//  Movie.swift
//
//
//  Created by Roman Indermühle on 15.02.2024.
//

import Foundation
import Vapor
import Fluent

final class Movie: Model, Content {
    
    static let schema = "movies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "year")
    var release_year: Int?
    
    @Field(key: "genre")
    var genre: [String]?
    
    @Field(key: "director")
    var director: Director.IDValue?
    
    
    init() {}
    
    init(id: UUID? = nil, title: String, release_year: Int?, genre: [String]?, director: Director.IDValue?) {
        self.id = id
        self.title = title
        self.release_year = release_year
        self.genre = genre
        self.director = director
    }
}
