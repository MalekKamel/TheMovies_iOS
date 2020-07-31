//
// Created by mac on 2019-07-11.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit
import SnapKit
import CoreGraphics
import Core

class IconLabel: UILabel {

    /// A UIImage value that set LeftImage to the UITextView
    @IBInspectable open var leftImage: UIImage? {
        didSet {
            if (leftImage != nil) {
                self.applyLeftImage(leftImage!)
            }
        }
    }

    fileprivate func applyLeftImage(_ image: UIImage) {

        //Create Attachment
        let imageAttachment =  NSTextAttachment()

        imageAttachment.image = image

        imageAttachment.bounds = CGRect(
                x: 0,
                y: 0,
                width: image.size.width,
                height: image.size.height
        ).integral

        let attachmentString = NSAttributedString(attachment: imageAttachment)

        let completeText = NSMutableAttributedString(string: " ")

        completeText.append(attachmentString)

        if attributedText == nil {
            completeText.append(NSMutableAttributedString(string: "  \(text ?? "")"))
            attributedText = completeText;
            return
        }

        let string = NSMutableAttributedString(string: "  ")
        string.append(attributedText as! NSMutableAttributedString)

        completeText.append(string)
        attributedText = completeText;
        SemanticContentHelper.forceRtl(view: self)
    }

}
