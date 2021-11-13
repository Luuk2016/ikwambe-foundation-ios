//
//  ContentView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
        }.navigationTitle("Ikwambe Foundation")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
