//
//  File.swift
//  
//
//  Created by Roman Indermühle on 10.03.2024.
//

import Foundation
import Vapor
import Fluent

struct MovieDTO: Content {
    var id: UUID?
    var title: String
    var year: Int
    var people: People.IDValue
}
