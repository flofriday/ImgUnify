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
                    ForEach(self.files, id: \.self.path) {
                        FileView(file: $0)
                    }
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
                                path: $0.relativePath) }
                        )
                    }
                }
                Button("Clear") {
                    self.files = []
                }
                Button("Copy") {}
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
