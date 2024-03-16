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
    
    @Field(key: "release_year")
    var release_year: Int?
    
    @Field(key: "production_costs")
    var production_costs: String?
    
    @Field(key: "genre")
    var genre: [String]?
    
    @Field(key: "director")
    var director: Director.IDValue?
    
    
    init() {}
    
    init(id: UUID? = nil, title: String, release_year: Int?, production_costs: String?, genre: [String]?, director: Director.IDValue?) {
        self.id = id
        self.title = title
        self.release_year = release_year
        self.production_costs = production_costs
        self.genre = genre
        self.director = director
    }
}
