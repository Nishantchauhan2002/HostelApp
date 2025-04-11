//
//  UIImage+Gif.swift
//  DemoApp
//
//  Created by Nishant Chauhan on 11/04/25.
//

import UIKit
import ImageIO

extension UIImage {

    public class func gif(name: String) -> UIImage? {
        guard let bundleURL = Bundle.main.url(forResource: name, withExtension: "gif") else {
            print("SwiftGif: This image named \"\(name)\" does not exist")
            return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }

        return gif(data: imageData)
    }

    public class func gif(data: Data) -> UIImage? {
        let options: [CFString: Any] = [
            kCGImageSourceShouldCache: false
        ] as [CFString : Any]

        guard let imageSource = CGImageSourceCreateWithData(data as CFData, options as CFDictionary) else {
            print("SwiftGif: Source for the image does not exist")
            return nil
        }

        let count = CGImageSourceGetCount(imageSource)

        var images = [UIImage]()
        var gifDuration = 0.0

        for i in 0..<count {
            guard let image = CGImageSourceCreateImageAtIndex(imageSource, i, options as CFDictionary) else {
                continue
            }

            let frameDuration = UIImage.frameDuration(from: imageSource, at: i)
            gifDuration += frameDuration

            images.append(UIImage(cgImage: image))
        }

        return UIImage.animatedImage(with: images, duration: gifDuration)
    }

    class func frameDuration(from source: CGImageSource, at index: Int) -> Double {
        var frameDuration = 0.1

        guard let frameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any],
              let gifProperties = frameProperties[kCGImagePropertyGIFDictionary as String] as? [String: Any] else {
            return frameDuration
        }

        if let delayTime = gifProperties[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double {
            frameDuration = delayTime
        } else if let delayTime = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double {
            frameDuration = delayTime
        }

        if frameDuration < 0.011 {
            frameDuration = 0.100
        }

        return frameDuration
    }
}
