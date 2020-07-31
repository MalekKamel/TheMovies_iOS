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

final class DiscoverMoviesVC: UIViewController, ViewControllerProtocol {
    var vm: DiscoverMoviesVM!
    private var movies: [Movie] = []
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.setup(source: self, cellIdentifier: .movieCell)
            tableView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }

    private func loadMovies() {
        vm.discoverMovies().subscribe(onSuccess: { [weak self] response in
                    guard let self = self else {
                        return
                    }
                    self.movies = response.results
                    self.tableView.reloadData()
                })
                .disposed(by: disposeBag)
    }
}

extension DiscoverMoviesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeueReusableCell(withIdentifier: .movieCell, for: indexPath)
        cell.setup(item: movies[indexPath.row])
        return cell
    }
}

