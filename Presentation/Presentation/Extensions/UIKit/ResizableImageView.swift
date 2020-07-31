//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

protocol ResizableImageViewDelegate: class {
    func resizableImageViewDidSetImage(_: ResizableImageView)
}

@IBDesignable
final class ResizableImageView: UIImageView {
    weak var delegate: ResizableImageViewDelegate?

    @IBInspectable var maximumWidth: CGFloat = 150
    @IBInspectable var maximumHeight: CGFloat = 100

    fileprivate let progressView: UIProgressView = UIProgressView()

    override func awakeFromNib() {
        super.awakeFromNib()

        contentMode = .scaleAspectFit
        layer.cornerRadius = 8
        clipsToBounds = true

        progressView.layer.cornerRadius = 8
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 8
        progressView.subviews[1].clipsToBounds = true
        progressView.progressTintColor = .hiHitchHikerYellow

        progressView.isHidden = true
        addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        progressView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        progressView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[progressView]-8-|",
                                                      options: .directionLeadingToTrailing, metrics: nil,
                                                      views: ["progressView": progressView]))
    }

    override var image: UIImage? {
        didSet {
            guard image != oldValue else { return }
            invalidateIntrinsicContentSize()
            layoutIfNeeded()
            self.delegate?.resizableImageViewDidSetImage(self)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard maximumWidth > frame.width else { return }
        maximumWidth = frame.width
        invalidateIntrinsicContentSize()
    }

    override var intrinsicContentSize: CGSize {
        guard var imageSize = image?.size else { return CGSize(width: maximumWidth, height: maximumHeight) }

        if imageSize.width > maximumWidth {
            let originalWidth = imageSize.width
            imageSize.width = maximumWidth
            imageSize.height = imageSize.height * (maximumWidth / originalWidth)
        }

        return imageSize
    }

    func setImageWithProgressView(url: URL?, placeholder: UIImage?) {
        setImage(url: url, placeholder: placeholder) { [weak self] (progress, total, _) in
            DispatchQueue.main.async {
                guard let `self` = self else { return }
                let progress = Float(progress) / Float(total)
                self.progressView.setProgress(progress, animated: true)
                self.progressView.isHidden = progress == 1
            }
        }
    }
}
