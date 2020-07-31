//
// Created by mac on 2019-06-04.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

extension UIImageView {

    func setImage(
            base64: String?,
            placeholder: UIImage? = nil
    ){
        guard base64 != nil else {
            image = placeholder
            return
        }

        let imageData = Data(base64Encoded: base64!)

        guard imageData != nil else {
            image = placeholder
            return
        }

        image = UIImage(data: imageData!)
    }


}
