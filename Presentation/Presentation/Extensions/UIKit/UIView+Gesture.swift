//
// Created by mac on 2019-03-21.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public extension UIView {

    func tap(target: Any?, action: Selector?) {
        isUserInteractionEnabled = true // disabled by default in label, ImageView...etc
        addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }

    // we add a subview to avoid ARC of selectorImpl
    // and selectorImpl is here to avoid defining
    // the ugly @objc at call site
    func tap(handler: @escaping () -> Void) {

        isUserInteractionEnabled = true // disabled by default in label, ImageView...etc

        let view = TapView()
        addSubview(view)
//        bringSubviewTo(view)

        let selectorImpl =  SelectorImpl(handler: handler)

        view.selectorImpl = selectorImpl;
//        view.backgroundColor = Asset.Colors.blackDark.color
    }
}

class TapView: UIView {
    var selectorImpl: SelectorImpl! {
        didSet {
            isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(
                    target: selectorImpl,
                    action: #selector(selectorImpl.handleTap)
            )
            gesture.delegate = self
            addGestureRecognizer(gesture)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview == nil { return }
        self.snp.makeConstraints { (make) in
            make.left.equalTo(superview!)
            make.right.equalTo(superview!)
            make.height.equalTo(superview!)
            make.bottom.equalTo(superview!)
        }
    }

    override func removeFromSuperview() {
        super.removeFromSuperview()
//        selectorImpl.releaseMe()
    }

    deinit {
        print("TapView deinit")
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}


class SelectorImpl: NSObject {
    var handler: () -> Void

    init(handler: @escaping () -> Void) {
        self.handler = handler
        super.init()
    }

    @objc func handleTap() {
        handler()
    }

    deinit {
        print("SelectorImpl deinit")
    }


}

extension TapView: UIGestureRecognizerDelegate {
//    func gestureRecognizer(
//            _ gestureRecognizer: UIGestureRecognizer,
//            shouldReceive touch: UITouch
//    ) -> Bool {
//        // allow button press
//        return touch.view == gestureRecognizer.view
//    }
}
