//
//  FileView.swift
//  ImgUnify
//
//  Created by flo on 24.03.23.
//

import SwiftUI

// NOTE: This ressource might be handy
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-support-drag-and-drop-in-swiftui
struct FileView: View {
    var file: File

    var body: some View {
        VStack {
            // Image(systemName: "photo")
            // Image(data: Data(contentsOf: path))
            Image(nsImage: NSImage(contentsOfFile: file.path)!)
                // .antialiased(true)
                .interpolation(.high)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 60)
                .cornerRadius(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.white, lineWidth: 3)
                )
                .shadow(radius: 2)
            Text(self.file.name)
                .textSelection(.enabled)
        }
    }
}
