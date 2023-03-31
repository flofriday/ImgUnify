//
//  ContentView.swift
//  ImgUnify
//
//  Created by flo on 24.03.23.
//

import SwiftUI

struct ContentView: View {
    @State private var files: [File] = []

    var body: some View {
        VStack {
            if files.isEmpty {
                Text("No files selected")
                    .italic()
            } else {
                HStack {
                    HStack {
                        ForEach(self.files, id: \.self.name) {
                            FileView(file: $0)
                        }
                    }
                    Image(systemName: "arrow.right")
                    FileView(
                        file: File(
                            name: "unified",
                            image: unified(images: files.map { $0.image })
                        )
                    )
                }
            }
            HStack {
                Button("Open") {
                    let panel = NSOpenPanel()
                    // FIXME: only set image types
                    panel.allowsMultipleSelection = true
                    panel.canChooseDirectories = false
                    if panel.runModal() == .OK {
                        self.files.append(contentsOf:
                            panel.urls.map { File(
                                name: $0.lastPathComponent,
                                // FIXME: This might fail
                                image: NSImage(contentsOfFile: $0.relativePath)!
                            ) }
                        )
                    }
                }
                Button("Clear") {
                    self.files = []
                }
                .disabled(files.isEmpty)
                Button("Copy") {
                    let pb = NSPasteboard.general
                    pb.clearContents()
                    // FIXME: Select the correct file
                    let file = unified(images: self.files.map { $0.image })
                    pb.writeObjects([file])
                }
                .disabled(files.isEmpty)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
