//
//  AppView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 15/09/2025.
//

import SwiftUI

@Observable
class AppState {
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.standard.set(showTabBar, forKey: "showTabbarView")
        }
    }
    
    init(showTabBarView: Bool) {
        self.showTabBar = showTabBarView
    }
    
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
}

struct AppView: View {
    
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}

#Preview("AppView - Tabbar") {
    AppView(showTabBar: true)
}
#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
