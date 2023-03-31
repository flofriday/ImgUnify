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
            Image(nsImage: file.image)
                .interpolation(.high)
                .resizable()
                .aspectRatio(contentMode: .fit)
                // FIXME: If the Image is in portrait we should instead limit the height to 60
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
