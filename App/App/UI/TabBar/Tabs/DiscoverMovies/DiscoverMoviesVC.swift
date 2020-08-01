//
//  SplashVC.swift
//  App
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2020 sha. All rights reserved.
//

import UIKit
import Presentation
import WMSegmentControl
import Data
import RxSwift
import RxRequester

final class DiscoverMoviesVC: UIViewController, ViewControllerProtocol {
    var vm: DiscoverMoviesVM!
    private var movies: [Movie] = []
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: PagedTableView! {
        didSet {
            tableView.setup(cellIdentifier: .movieCell)
            tableView.pagedDataSource = self
            tableView.pager = pager
            pager.start()
        }
    }
    private lazy var pager: Pager = {
        Pager.Builder()
                .loadMore { [weak self] next in
                    guard let self = self else {
                        return
                    }
                    self.loadMovies(page: next)
                }
                .build()
    }()

    private func loadMovies(page: Int = 1) {
        if page == 1 {
            movies.removeAll()
            tableView.reloadData()
        }

        let options = RequestOptions.Builder()
                .showLoading(false)
                .doOnError { error in
                    self.tableView.hidLoading()
                }
                .build()

        vm.discoverMovies(options: options, request: MoviesRequest(nextPage: page))
                .subscribe(onSuccess: { [weak self] response in
                    self?.showMovies(movies: response)
                })
                .disposed(by: disposeBag)
    }

    private func showMovies(movies: [Movie]) {
        self.movies += movies
        self.pager.notifyItemsLoaded(count: movies.count)
    }
}

extension DiscoverMoviesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeueReusableCell(withIdentifier: .movieCell, for: indexPath)
        cell.setup(item: movies[indexPath.row])
        return cell
    }
}

