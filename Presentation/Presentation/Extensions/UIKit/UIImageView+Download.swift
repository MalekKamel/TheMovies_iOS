//Copyright HitchHiker© 2017. All rights reserved.

import SDWebImage

public extension UIImageView {

    func loadImage(
            url: String?,
            placeholder: UIImage? = nil,
            progressBlock: ((Int, Int, URL?) -> Void)? = nil
    ) {
        guard url != nil else {
            image = placeholder
            return
        }
        let encoded = url!
                .addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)

        guard encoded != nil else {
            image = placeholder
            return
        }

        setImage(url: URL(string: encoded!), placeholder: placeholder)
    }

    func setImage(
            url: URL?,
            placeholder: UIImage? = nil,
            progressBlock: ((Int, Int, URL?) -> Void)? = nil
    ) {
        let options: SDWebImageOptions = [
            .scaleDownLargeImages,
            .continueInBackground,
            .lowPriority,
            .allowInvalidSSLCertificates
        ]
        sd_setImage(
                with: url,
                placeholderImage: placeholder,
                options: options,
                progress: progressBlock,
                completed: { (image, error, cacheType, imageURL) in
                    if error != nil { print(error!) }
                })
    }
}
