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


class DirectorController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let api = routes.grouped("api")
        
        // POST: /api/directors
        api.post("directors", use: create)
        
        // GET: /api/directors
        api.get("directors", use: getAll)
        
        // GET: /api/directors/:directorId
        api.get("directors", ":directorId", use: getById)
        
        // DELETE: //api/directors/:directorId
        api.delete("directors", ":directorId", use: deleteMovie)
        
        // PUT: /api/directors/:directorId
        api.put("directors", ":directorId", use: updateDirector)
        
    }
    
    
    func updateDirector(req: Request) async throws -> Director {
        
        guard let directorId = req.parameters.get("directorId", as: UUID.self) else {
            throw Abort(.notFound)
        }
        
        guard let director = try await Director.find(directorId, on: req.db) else {
            throw Abort(.notFound, reason: "DirectorId \(directorId) was not found.")
        }
        
        // decode the body
        let updateDirector = try req.content.decode(Director.self)
        
        director.name = updateDirector.name
        director.age = updateDirector.age
        director.residence = updateDirector.residence
        director.mail = updateDirector.mail
        director.movies = updateDirector.movies
        
        try await director.update(on: req.db)
        return director
        
    }
    
    func deleteMovie(req: Request) async throws -> Director {
        
        guard let directorId = req.parameters.get("directorId", as: UUID.self) else {
            throw Abort(.notFound)
        }
        
        guard let director = try await Director.find(directorId, on: req.db) else {
            throw Abort(.notFound, reason: "DirectorId \(directorId) was not found.")
        }
        
        try await director.delete(on: req.db)
        return director
        
    }
    
    func getById(req: Request) async throws -> Director {
        
        guard let directorId = req.parameters.get("directorId", as: UUID.self) else {
            throw Abort(.notFound)
        }
        
        guard let director = try await Director.find(directorId, on: req.db) else {
            throw Abort(.notFound, reason: "DirectorId \(directorId) was not found.")
        }
        
        return director
        
    }
    
    func getAll(req: Request) async throws -> [Director] {
        return try await Director.query(on: req.db)
            .all()
    }
    
    
    func create(req: Request) async throws -> Director {
        
        let director = try req.content.decode(Director.self)
        try await director.save(on: req.db)
        return director
        
    }
    
}
