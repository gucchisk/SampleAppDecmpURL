//
//  ContentView.swift
//  SampleAppDecmpURL
//
//  Created by Satoshi Kobayashi on 2020/05/14.
//  Copyright © 2020 Satoshi Kobayashi. All rights reserved.
//

import SwiftUI
import decmpURL

struct ContentView: View {
    @State private var url = ""
    var body: some View {
        VStack {
            TextField("URL", text: $url).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("check") {
                guard let u = URL(string: url) else {
                    return
                }
                let decmp = DecmpURL(url: u)
                decmp.decompress(completion: (result) -> {
                    switch result {
                    case .success(let url):
                        print(url)
                    }
                })
            }
            Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
