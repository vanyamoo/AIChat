//
//  ExploreView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                
                Section {
                    CarouselView(
                        items: featuredAvatars,
                        content: { avatar in
                            HeroCellView(
                                title: avatar.name,
                                subtitle: avatar.characterDescription,
                                imageName: avatar.profileImageName
                            )
                        }
                    )
                    .removeListRowFormatting()
                    
                } header: {
                    Text("Featured Avatars")
                }
                
            }
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
