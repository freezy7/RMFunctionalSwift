//
//  CoreImage.swift
//  RMFunctionalSwift
//
//  Created by R_flava_Man on 16/5/26.
//  Copyright © 2016年 R_style_Man. All rights reserved.
//

import UIKit

class CoreImage: NSObject {

}

typealias Filter = CIImage -> CIImage

func blur(radius: Double) -> Filter {
    return {
        image in
        let parameters = [kCIInputRadiusKey:radius, kCIInputImageKey:image]
        guard let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: parameters) else {fatalError()}
        guard let outoutImage = filter.outputImage else {fatalError()}
        return outoutImage
    }
}

func colorGenerator(color: UIColor) -> Filter {
    return {
        _ in
        let c = CIColor(color: color)
        let parameters = [kCIInputColorKey: c]
        guard let filter = CIFilter(name: "CIConstantColorGenerator", withInputParameters: parameters) else {fatalError()}
        guard let outputImage = filter.outputImage else {fatalError()}
        return outputImage
    }
}

func compositeSourceOver(overlay: CIImage) -> Filter {
    return {
        image in
        let parameters = [kCIInputBackgroundImageKey: image, kCIInputImageKey: overlay]
        guard let filter = CIFilter(name: "CISourceOverCompositing", withInputParameters: parameters) else {fatalError()}
        guard let outputImage = filter.outputImage else {fatalError()}
        let cropRect = image.extent
        return outputImage.imageByCroppingToRect(cropRect)
    }
}

func colorOverlay(color: UIColor) -> Filter {
    return { image in
        let overlay = colorGenerator(color)(image)
        return compositeSourceOver(overlay)(image)
    }
}

infix operator >>> {associativity right}

func >>>(filter1: Filter, filter2: Filter) -> Filter {
    return {image in filter2(filter1(image))}
}

