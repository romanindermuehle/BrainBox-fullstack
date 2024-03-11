//
//  File.swift
//  
//
//  Created by Roman Indermühle on 10.03.2024.
//
import Vapor
import Fluent
import Foundation

final class People: Model, Content {
    
    static let schema = "people"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "age")
    var age: Int
    
    init() {}
    
    init(id: UUID? = nil, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    
    
}
