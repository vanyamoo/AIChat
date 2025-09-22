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
            UserDefaults.showTabbarView = showTabBar
        }
    }
    
    init(showTabBarView: Bool = UserDefaults.showTabbarView) {
        self.showTabBar = showTabBarView
    }
    
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
}

extension UserDefaults {
    
    private struct Keys {
        static let showTabbarView = "showTabbarView"
    }
    
    static var showTabbarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabbarView)
        }
        set {
            standard.set(newValue, forKey: Keys.showTabbarView)
        }
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
