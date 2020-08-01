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

    @IBAction func search(_ sender: UIButton) {
        movies.removeAll()
        pager.start()
    }

    private func searchMovies(page: Int = 1) {
        searchBar.endEditing(true)
        guard vm.isValidSearch(query: searchBar.text) else {
            return
        }
        let request = MoviesRequest(search: searchBar.text ?? "", nextPage: page)
        vm.searchMovies(request: request, showLoading: page == 1)
                .subscribe(onSuccess: { [weak self] response in
                    guard let self = self else {
                        return
                    }
                    self.movies += response.results
                    self.pager.notifyItemsLoaded(count: response.results.count)
                })
                .disposed(by: disposeBag)
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
        movies.removeAll()
        pager.start()
    }
}
