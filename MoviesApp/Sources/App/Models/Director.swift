//
//  File.swift
//  
//
//  Created by Roman Indermühle on 10.03.2024.
//
import Vapor
import Fluent
import Foundation

final class Director: Model, Content {
    
    static let schema = "directors"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "age")
    var age: Int?
    
    @Field(key: "residence")
    var residence: String?
    
    @Field(key: "mail")
    var mail: String?
    
    @Field(key: "movies")
    var movies: [Movie.IDValue]?
    
    init() {}
    
    init(id: UUID? = nil, name: String, age: Int?, residence: String?, mail: String?, movies: [Movie.IDValue]?) {
        self.id = id
        self.name = name
        self.age = age
        self.residence = residence
        self.mail = mail
        self.movies = movies
        
    }
    
    
}
