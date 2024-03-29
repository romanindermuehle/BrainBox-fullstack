import NIOSSL
import Fluent
import FluentMongoDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    try app.databases.use(DatabaseConfigurationFactory.mongo(
        connectionString: Environment.get("DATABASE_URL") ?? "mongodb://localhost:27017/brainBox_database"
    ), as: .mongo)
    
    //register controllers
    try app.register(collection: MoviesController())
    
    try app.register(collection: DirectorController())
    
    // register routes
    try routes(app)
}
