//
//  File.swift
//  
//
//  Created by Roman Indermühle on 10.03.2024.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver


class PeopleController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let api = routes.grouped("api")
        
        // POST: /api/movies
        api.post("people", use: create)
        
        // GET: /api/movies
        api.get("people", use: getAll)
        
//        // GET: /api/movies/:movieId
//        api.get("people", ":peopleId", use: getById)
//        
//        // DELETE: //api/movies/:movieId
//        api.delete("people", ":peopleId", use: deleteMovie)
//        
//        // PUT: /api/movies/movieId
//        api.put("people", ":peopleId", use: updateMovie)
        
    }
    
    
    func getAll(req: Request) async throws -> [People] {
        return try await People.query(on: req.db)
            .all()
    }
    
    
    func create(req: Request) async throws -> People {
        
        let people = try req.content.decode(People.self)
        try await people.save(on: req.db)
        return people
        
    }
    
    
}
