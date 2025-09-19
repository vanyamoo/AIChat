//
//  WelcomeView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome!")
                    .frame(maxHeight: .infinity)
                
                NavigationLink {
                    Text("Onboarding Completed")
                } label: {
                    Text("Get Started")
                        .callToActionButton()
                }

            }
            .padding(16)
        }
    }
}

#Preview {
    WelcomeView()
}
