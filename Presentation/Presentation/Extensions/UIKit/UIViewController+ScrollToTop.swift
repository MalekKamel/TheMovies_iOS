//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIViewController {
    func scrollToTop() {
        func scrollToTop(view: UIView?) {
            guard let view = view else { return }

            switch view {
            case let scrollView as UIScrollView:
                if scrollView.scrollsToTop == true {
                    var offset = CGPoint(
                        x: -scrollView.contentInset.left,
                        y: -scrollView.contentInset.top)

                    if #available(iOS 11.0, *) {
                        offset = CGPoint(
                            x: -scrollView.adjustedContentInset.left,
                            y: -scrollView.adjustedContentInset.top)
                    }

                    scrollView.setContentOffset(offset, animated: true)
                    return
                }
            default:
                break
            }

            for subView in view.subviews {
                scrollToTop(view: subView)
            }
        }
        scrollToTop(view: view)
    }
}
