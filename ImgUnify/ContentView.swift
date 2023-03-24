//
//  ContentView.swift
//  ImgUnify
//
//  Created by flo on 24.03.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isVertical = false
    var body: some View {
        HStack {
            FileView()
            FileView() 
        }
        .padding()
        .toolbar {
            ToolbarItemGroup {

                // FIXME: add toggle for vertical
                /*Toggle(isOn: $isVertical) {
                    if (isVertical) {
                        
                    }
                }*/
                Button("Copy") { }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
