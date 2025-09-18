//
//  ProfileView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton

                    }
                }
        }
        .sheet(isPresented: $showSettingsView) {
            Text("SettingsView")
        }
    }
    
    private var settingsButton: some View {
        Button {
            showSettingsView = true
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
}

#Preview {
    ProfileView()
}
