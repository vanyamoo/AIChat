//
//  TabBarView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
            
            NavigationStack {
                Text("Chats")
                    .navigationTitle("Chats")
            }
                .tabItem {
                    Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
                }
            
            NavigationStack {
                Text("Profile")
                    .navigationTitle("Profile")
            }
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
