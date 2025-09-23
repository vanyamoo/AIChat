//
//  SettingsView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 23/09/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(AppState.self) private var appState: AppState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutTapped()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func onSignOutTapped() {
        // do some logic to sign user out of app!
        appState.updateViewState(showTabBarView: false)
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
