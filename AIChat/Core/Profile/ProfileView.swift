//
//  ProfileView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView: Bool = false
    @State private var currentUser: UserModel? = .mock
    
    var body: some View {
        NavigationStack {
            List {
                myInfoSection
            }
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton

                    }
                }
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
    }
    
    private var myInfoSection: some View {
        Section {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColorCalculated ?? .accent)
                
            }
            .frame(width: 100, height: 100)
            .frame(maxWidth: .infinity)
            .removeListRowFormatting()
        }
    }
    
    private var settingsButton: some View {
        Button {
            onSettingsButtonPressed()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
    
    private func onSettingsButtonPressed() {
        showSettingsView = true
    }
}

#Preview {
    ProfileView()
}
