import CoreData
import UIKit.UIApplication

    //MARK: - error
enum CoreDataError: Error {
    case error(String)
}

    //MARK: - manager coreData
final class CoreDataManager {
    
    //MARK: - singltone
    static let instance = CoreDataManager()
    init() { }
    
    //MARK: - save method
    func saveMovie(imageFilm: Data, filmName: String, reating: String, releaseData: String, youtubeLink: String, descriptionFilm: String) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let managerContent = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managerContent)!
        let movie = NSManagedObject(entity: entity, insertInto: managerContent)
        
        
        movie.setValue(imageFilm, forKey: "imageFilm")
        movie.setValue(filmName, forKey: "filmName")
        movie.setValue(reating, forKey: "reating")
        movie.setValue(youtubeLink, forKey: "youtubeLink")
        movie.setValue(descriptionFilm, forKey: "descriptionFilm")
        
        do {
            try managerContent.save()
        } catch {
            return .failure(.error("Cloud not save \(error)"))
        }
        return .success(())
    }
    
    //MARK: - load method
    func loadMovie() -> Result<[Movie], CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let namagerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do {
            let object = try namagerContext.fetch(fetchRequest)
            guard let fetchMovie = object as? [Movie] else {
                return .failure(.error("Cloud not cast as [Movie]"))
            }
            return .success(fetchMovie)
        } catch {
            return .failure(.error("Cloud not fetch \(error)"))
        }
    }
    //MARK: - deleteFilm
    func deleteFilm(_ movie: Movie) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let manegetContext = appDelegate.persistentContainer.viewContext
        do {
            manegetContext.delete(movie)
            try manegetContext.save()
            return .success(())
        } catch {
            return .failure(.error("Error deleting movie \(error)"))
        }
    }
}
