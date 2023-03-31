//
//  File.swift
//  ImgUnify
//
//  Created by flo on 31.03.23.
//

import Foundation
import SwiftUI

struct File {
    var name: String
    var image: NSImage
}

func unified(images: [NSImage]) -> NSImage {
    let width = images.map { $0.size.width }.reduce(0, +)
    let height = images.map { $0.size.height }.max()!
    let newImage = NSImage(size: NSSize(width: width, height: height))

    newImage.lockFocus()
    var x: CGFloat = 0
    for img in images {
        img.draw(at: NSPoint(x: x, y: 0), from: NSRect(origin: NSPoint.zero, size: img.size), operation: .sourceOver, fraction: 1.0)
        x += img.size.width
    }
    newImage.unlockFocus()
    return newImage
}
