//
//  CreateAvatarView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 06/10/2025.
//

import SwiftUI

struct CreateAvatarView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var avatarName: String = ""
    @State private var selectedCharacterOption: CharacterOption = .defaultValue
    @State private var selectedCharacterAction: CharacterAction = .defaultValue
    @State private var selectedCharacterLocation: CharacterLocation = .defaultValue
    
    @State private var isGenerating: Bool = false
    @State private var generatedImage: UIImage?
    
    @State private var isSaving: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                nameSection
                
                attributesSection
                
                imageSection
                
                saveSection
            }
            .navigationTitle("Create Avatar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
    }
    
    private var backButton: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .anyButton {
                onBackButtonPressed()
            }
    }
    
    private var nameSection: some View {
        Section {
            TextField("Player 1", text: $avatarName)
        } header: {
            Text("Name Your Avatar*")
        }
    }
    
    private var attributesSection: some View {
        Section {
            Picker("is a...", selection: $selectedCharacterOption) {
                ForEach(CharacterOption.allCases, id: \.self) { characterOption in
                    Text(characterOption.rawValue.capitalized)
                        .tag(characterOption)
                }
            }
            
            Picker("that is...", selection: $selectedCharacterAction) {
                ForEach(CharacterAction.allCases, id: \.self) { characterAction in
                    Text(characterAction.rawValue.capitalized).tag(characterAction)
                }
            }
            
            Picker("in the...", selection: $selectedCharacterLocation) {
                ForEach(CharacterLocation.allCases, id: \.self) { characterLocation in
                    Text(characterLocation.rawValue.capitalized).tag(characterLocation)
                }
            }
        } header: {
            Text("Attributes")
        }
    }
    
    private var imageSection: some View {
        Section {
            HStack(alignment: .top) {
                ZStack {
                    Text("Generate image")
                        .underline()
                        .foregroundStyle(.accent)
                        .anyButton {
                            onGenerateImagePressed()
                        }
                        .opacity(isGenerating ? 0 : 1)
                    
                    ProgressView()
                        .tint(.accent)
                        .opacity(isGenerating ? 1 : 0)
                }
                .disabled(isGenerating || avatarName.isEmpty)
                
                Circle()
                    .fill(.secondary.opacity(0.3))
                    .overlay(
                        ZStack {
                            if let generatedImage {
                                Image(uiImage: generatedImage)
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                    )
                    .clipShape(Circle())
            }
            .removeListRowFormatting()
            .padding(4)
        }
    }
    
    private var saveSection: some View {
        Section {
            AsyncCallToActionButton(
                isLoading: isSaving,
                title: "Save",
                action: onSavePressed
            )
            .removeListRowFormatting()
            .padding(8)
            .opacity(generatedImage == nil ? 0.5 : 1.0)
            .disabled(generatedImage == nil)
        }
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    private func onGenerateImagePressed() {
        isGenerating = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            generatedImage = UIImage(systemName: "star.fill")
            
            isGenerating = false
        }
    }
    
    private func onSavePressed() {
        isSaving = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            
            dismiss()
            isSaving = false
        }
    }
}

#Preview {
    CreateAvatarView()
}
