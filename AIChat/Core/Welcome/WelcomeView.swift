//
//  WelcomeView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var imageName: String = Constants.randomImage
    
    var body: some View {
        NavigationStack {
            VStack {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                VStack {
                    Text("AI Chat 🤙")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("YouTube @Swiftful Thinking")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 24)
                
                VStack {
                    NavigationLink {
                        OnboardingCompletedView()
                    } label: {
                        Text("Get Started")
                            .callToActionButton()
                    }
                    
                    Text("Already have an account? Sign in!")
                        .underline()
                        .padding(8)
                        .tappableBackground()
                        .onTapGesture {
                            
                        }
                }
                .padding(16)
                
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
    }
}

#Preview {
    WelcomeView()
}
