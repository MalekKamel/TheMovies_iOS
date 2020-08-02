//
// Created by Apple on 02/08/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester

class MockPresentable: Presentable {
    var isShowErrorCalled = false
    var isShowLoadingCalled = false
    var isHideLoadingCalled = false
    var isOnHandleErrorFailedCalled = false
    var errorMessage = ""

    func showError(error: String) {
        errorMessage = error
        isShowErrorCalled = true
    }

    func showLoading() {
        isShowLoadingCalled = true
    }

    func hideLoading() {
        isHideLoadingCalled = true
    }

    func onHandleErrorFailed(error: Error) {
        isOnHandleErrorFailedCalled = true
    }

}
