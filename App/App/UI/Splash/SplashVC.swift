//
//  SplashVC.swift
//  App
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2019 Shaban Kamel. All rights reserved.
//

import UIKit
import Data
import Presentation

final class SplashVC: UIViewController, ViewControllerProtocol {
    var vm: SplashVM!

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            TabBarVCBuilder.make().push()
        }
    }

}
