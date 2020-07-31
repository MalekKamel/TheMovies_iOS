//
//  DataProvider.swift
//  SchoolBus
//
//  Created by Sha on 1/16/19.
//  Copyright © 2019 A. All rights reserved.
//

import Foundation

final class DataProvider: NSObject {
    var delegate: DataProviderDelegate?

    func start(completionBlock: @escaping () -> Void) {
        completionBlock()
    }
}

protocol DataProviderDelegate: class {

}

