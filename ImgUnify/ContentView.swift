//
//  ContentView.swift
//  ImgUnify
//
//  Created by flo on 24.03.23.
//

import SwiftUI

struct ContentView: View {
    @State private var fileNames: [String] = []

    var body: some View {
        VStack {
            if fileNames.isEmpty {
                Text("No files selected")
                    .italic()
            } else {
                VStack {
                    ForEach(self.fileNames, id: \.self) {
                        Text($0)
                    }
                }
            }
            HStack {
                Button("Open") {
                    let panel = NSOpenPanel()
                    panel.allowsMultipleSelection = true
                    panel.canChooseDirectories = false
                    if panel.runModal() == .OK {
                        self.fileNames.append(contentsOf:
                            panel.urls.map { $0.relativePath }
                        )
                    }
                }
                Button("Clear") {
                    self.fileNames = []
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
