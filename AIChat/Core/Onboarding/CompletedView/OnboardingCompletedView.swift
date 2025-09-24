//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)
            
            

        }
        .safeAreaInset(edge: .bottom, content: {
            Button {
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        })
        .padding(16)
    }
    
    func onFinishButtonPressed() {
        // other logic to complete onboarding
        root.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
