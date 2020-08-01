
import Foundation
import RealmSwift
import RxSwift

class MovieDao {
    private lazy var realm: RealmManager = { RealmManager() }()

    func all() -> Single<[MovieEntity]> {
        realm.objects()
    }

    func add(movie: MovieEntity) -> Completable {
        realm.add(movie)
    }

    func add(movies: [MovieEntity]) -> Completable {
        realm.add(movies)
    }

    func delete(movie: MovieEntity) -> Completable {
        realm.delete(movie)
    }

    func movie(movieId: String) -> Single<MovieEntity> {
        realm.object(forPrimaryKey: movieId)
    }

}
