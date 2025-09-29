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
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.clear)
                    
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
