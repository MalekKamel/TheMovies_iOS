//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

@IBDesignable
final class FormEntryTextView: UITextView {
    @IBInspectable var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    fileprivate let placeholderLabel = UILabel()
    override var text: String! {
        didSet {
            self.placeholderLabel.isHidden = !self.text.isEmpty
        }
    }

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentInset = .zero
        textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textContainer.lineFragmentPadding = 0
        layer.cornerRadius = 5
    }
}

// MARK: - Actions
extension FormEntryTextView {
    @IBAction fileprivate func didChange(_: Any?) {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.isHidden = !self.text.isEmpty
        }
    }
}

// MARK: - Private methods
extension FormEntryTextView {
    fileprivate func setupUI() {
        textAlignment = effectiveUserInterfaceLayoutDirection == .rightToLeft ? .right : .left
        layer.borderWidth = 1
        layer.borderColor = UIColor.hhFormFieldSeparator.cgColor
        placeholderLabel.font = .defaultFontMedium14
        font = .defaultFontMedium14

        placeholderLabel.textColor = placeholderColor ?? .hiHint
        placeholderLabel.isUserInteractionEnabled = false
        placeholderLabel.backgroundColor = .clear
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[placeholderLabel]",
                                                      options: .directionLeadingToTrailing, metrics: nil,
                                                      views: ["placeholderLabel": placeholderLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[placeholderLabel]",
                                                      options: .directionLeadingToTrailing, metrics: nil,
                                                      views: ["placeholderLabel": placeholderLabel]))

        NotificationCenter.default.addObserver(self, selector: #selector(didChange(_:)),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }
}
