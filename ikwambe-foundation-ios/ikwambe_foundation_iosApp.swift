//
//  ikwambe_foundation_iosApp.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 11/11/2021.
//

import SwiftUI

@main
struct ikwambe_foundation_iosApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Label("The foundation", systemImage: "house.fill")
                }
                
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Label("Donate", systemImage: "heart")
                }
                
                NavigationView {
                    StoriesListView()
                }
                .tabItem {
                    Label("Stories", systemImage: "person.2")
                }
                
                NavigationView {
                    ProfileView()
                }
                .tabItem {
                    Label("My profile", systemImage: "person")
                }
            }
        }
    }
}
