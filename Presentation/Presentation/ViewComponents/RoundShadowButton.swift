//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

@IBDesignable
final class RoundShadowButton: UIButton {
    @IBInspectable var titleColor: UIColor = .white
    @IBInspectable var normalBackgroundColor: UIColor = Asset.Colors.orange.color
    @IBInspectable var disabledBackgroundColor: UIColor = .lightGray

    override var isEnabled: Bool {
        didSet {
            layer.backgroundColor = isEnabled ? normalBackgroundColor.cgColor : disabledBackgroundColor.cgColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        modifyAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modifyAppearance()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        modifyAppearance()
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        modifyAppearance()
        setTitleColor(titleColor, for: .normal)
    }

    override var intrinsicContentSize: CGSize {
        var width = super.intrinsicContentSize.width
        var height: CGFloat = 40
        if let titleLabelSize = titleLabel?.intrinsicContentSize {
            width = titleLabelSize.width
                + contentEdgeInsets.left + contentEdgeInsets.right
                + titleEdgeInsets.left + titleEdgeInsets.right
            height = max(height, titleLabelSize.height
                                + contentEdgeInsets.top + contentEdgeInsets.bottom
                                + titleEdgeInsets.top + titleEdgeInsets.bottom)
        }
        return CGSize(width: width , height: height)
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        titleLabel?.invalidateIntrinsicContentSize()
        invalidateIntrinsicContentSize()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pulsate()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIImpactFeedbackGenerator().impactOccurred()
    }

    private func modifyAppearance() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.hhFormFieldSeparator.cgColor

        titleLabel?.font = .defaultFont17
        titleLabel?.minimumScaleFactor = 0.5
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.textAlignment = .center
        titleLabel?.setContentCompressionResistancePriority(.required, for: .horizontal)
        titleLabel?.numberOfLines = 1

        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center

        contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)

        let isLeft = effectiveUserInterfaceLayoutDirection == .leftToRight
        let halfImageSize = (currentImage?.size.width ?? 0)
        let padding = halfImageSize + 8
        titleEdgeInsets = UIEdgeInsets(top: 0, left: isLeft ? padding : 8,
                                       bottom: 0, right: isLeft ? 8 : padding)

        backgroundColor = .clear

        layer.backgroundColor = isEnabled ? normalBackgroundColor.cgColor : disabledBackgroundColor.cgColor

        layer.cornerRadius = floor((frame.height / 2) - 1)
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
