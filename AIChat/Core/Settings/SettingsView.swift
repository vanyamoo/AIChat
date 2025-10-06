//
//  SettingsView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 23/09/2025.
//

import SwiftUI

fileprivate extension View {
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color(.systemBackground))
    }
    
}

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState: AppState
    
    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = true
    @State private var showCreateAccountView: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                accountSection
                
                purchasesSection
                
                applicationSection
            }
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $showCreateAccountView) {
            CreateAccountView()
                .presentationDetents([.medium])
        }
    }
    
    private var accountSection: some View {
        Section {
            if isAnonymousUser {
                Text("Save & back-up account")
                    .rowFormatting()
                    .anyButton(.highlight) {
                        onCreateAccountPressed()
                    }
                    .removeListRowFormatting()
            } else {
                Text("Sign Out")
                    .rowFormatting()
                    .anyButton(.highlight) {
                        onSignOutPressed()
                    }
                    .removeListRowFormatting()
            }
            
            Text("Delete Account")
                .foregroundStyle(.red)
                .rowFormatting()
                .anyButton(.highlight) {
                    onDeleteAccountPressed()
                }
                .removeListRowFormatting()
        } header: {
            Text("Account")
        }
    }
    
    private var purchasesSection: some View {
        Section {
            HStack {
                Text("Account status: \(isPremium ? "PREMIUM" : "FREE")")
                Spacer(minLength: 0)
                if isPremium {
                    Text("MANAGE")
                        .badgeButton()
                }
            }
            .rowFormatting()
            .anyButton(.highlight) {
                
            }
            .disabled(!isPremium)
            .removeListRowFormatting()
        } header: {
            Text("Purchases")
        }
    }
    
    private var applicationSection: some View {
        Section {
            HStack {
                Text("Version")
                Spacer(minLength: 0)
                Text(Utilities.appVersion ?? "")
                    .foregroundStyle(.secondary)
            }
            .rowFormatting()
            .removeListRowFormatting()
            
            HStack {
                Text("Build Number")
                Spacer(minLength: 0)
                Text(Utilities.buildNumber ?? "")
                    .foregroundStyle(.secondary)
            }
            .rowFormatting()
            .removeListRowFormatting()
            
            Text("Contact us")
                .foregroundStyle(.blue)
                .rowFormatting()
                .anyButton(.highlight, action: {
                    
                })
                .removeListRowFormatting()
        } header: {
            Text("Application")
        } footer: {
            Text("Created by Tiny Empire. \nLearn more at https://tinyempire.ie")
                .baselineOffset(6)
        }
    }
    
    func onSignOutPressed() {
        // do some logic to sign user out of app!
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBarView: false)
        }
    }
    
    func onDeleteAccountPressed() {
        
    }
    
    func onCreateAccountPressed() {
        showCreateAccountView = true
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
