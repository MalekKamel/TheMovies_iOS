//
//  SplashVC.swift
//  App
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2019 Shaban Kamel. All rights reserved.
//

import UIKit
import Presentation
import WMSegmentControl
import Data
import RxSwift
import RxRequester

final class SearchMoviesVC: UIViewController, ViewControllerProtocol {
    var vm: SearchMoviesVM!
    private var movies: [Movie] = []
    private let disposeBag = DisposeBag()
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.set(textColor: .black)
        }
    }
    @IBOutlet weak var tableView: PagedTableView! {
        didSet {
            tableView.setup(cellIdentifier: .movieCell)
            tableView.pagedDataSource = self
            tableView.pager = pager
        }
    }
    private lazy var pager: Pager = {
        Pager.Builder()
                .loadMore { [weak self] next in
                    guard let self = self else {
                        return
                    }
                    self.searchMovies(page: next)
                }
                .build()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchMovies(type: .local)
    }

    @IBAction func search(_ sender: UIButton) {
        startSearch()
    }

    private func startSearch() {
        movies.removeAll()
        tableView.reloadData()
        pager.start()
    }

    private func searchMovies(page: Int = 1, type: LoadType = .remote) {
        searchBar.endEditing(true)

        guard vm.isValidSearch(query: searchBar.text, type: type) else {
            return
        }

        let options = RequestOptions.Builder()
                .showLoading(false)
                .doOnError { error in
                    self.tableView.hidLoading()
                }
                .build()

        let request = MoviesRequest(search: searchBar.text ?? "", nextPage: page)
        vm.searchMovies(options: options, request: request, type: type)
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

extension SearchMoviesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeueReusableCell(withIdentifier: .movieCell, for: indexPath)
        cell.setup(item: movies[indexPath.row])
        return cell
    }
}

//MARK: SearchBar Delegate
extension SearchMoviesVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        startSearch()
    }
}
