//
//  DiscoverMoviesVMTest.swift
//  AppTests
//
//  Created by Apple on 02/08/2020.
//  Copyright © 2020 sha. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
import RxRequester
@testable import The_Movies

class DiscoverMoviesVMTest: XCTestCase {
    var requester: RxRequester!
    var presentable: MockPresentable!
    var scheduler: TestScheduler!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
