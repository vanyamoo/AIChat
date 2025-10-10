//
//  ExploreView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks
    
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                
                featuredSection
                
                categorySection
                
                popularSection
                
            }
            .navigationTitle("Explore")
            .navigationDestination(for: String.self) { newValue in
                ChatView(avatarId: newValue)
            }
        }
    }
    
    private var featuredSection: some View {
        Section {
            CarouselView(
                items: featuredAvatars,
                content: { avatar in
                    HeroCellView(
                        title: avatar.name,
                        subtitle: avatar.characterDescription,
                        imageName: avatar.profileImageName
                    )
                    .anyButton {
                        onAvatarPressed(avatar: avatar)
                    }
                }
            )
            .removeListRowFormatting()
            
        } header: {
            Text("Featured")
        }
    }
    
    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(avatar.avatarId)
    }
    
    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(
                                title: category.plural.capitalized,
                                imageName: Constants.randomImage
                            )
                            .anyButton {
                                
                            }
                        }
                    }
                }
                .frame(height: 140)
                .scrollIndicators(.hidden)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            }
            .removeListRowFormatting()
            
        } header: {
            Text("Categories")
        }
    }
    
    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: Constants.randomImage,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(.highlight) {
                    
                }
                .removeListRowFormatting()
            }
        } header: {
            Text("Popular")
        }
    }
}

#Preview {
    ExploreView()
}
