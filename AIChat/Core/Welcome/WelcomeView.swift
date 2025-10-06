//
//  WelcomeView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var imageName: String = Constants.randomImage
    @State private var showSignInView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24)
                
                ctaButtons
                    .padding(16)
                
                policyLinks
            }
        }
        .sheet(isPresented: $showSignInView) {
            CreateAccountView(
                title: "Sign in",
                subtitle: "Connect to an existing account."
            )
            .presentationDetents([.medium])
        }
    }
    
    private var titleSection: some View {
        VStack {
            Text("AI Chat 🤙")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("YouTube @Swiftful Thinking")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    private var ctaButtons: some View {
        VStack {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Already have an account? Sign in!")
                .underline()
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    onSignInPressed()
                }
        }
    }
    
    private func onSignInPressed() {
        showSignInView = true
    }
    
    private var policyLinks: some View {
        HStack {
            Link(destination: URL(string: Constants.termsOfserviceURL)!) {
                Text("Terms of Service")
            }
            
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            
            Link(destination: URL(string: Constants.privacyPolicyURL)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
