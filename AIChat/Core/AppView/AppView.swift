//
//  AppView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 15/09/2025.
//

import SwiftUI

struct AppView: View {
    
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBarView: true))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBarView: false))
}
