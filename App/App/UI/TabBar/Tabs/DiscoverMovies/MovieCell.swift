//
// Created by Shaban Kamel on 06/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit
import Presentation
import Data
import Core

class MovieCell: ConfigurableCell<Movie> {
    @IBOutlet weak var ivThumbnail: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    override func setup(item: Movie) {
        ivThumbnail.loadImage(url: item.poster())
        lblName.text = item.title
        lblReleaseDate.text = item.releaseDate
        lblOverview.text = item.overview
    }

}
