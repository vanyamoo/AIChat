//
//  ExploreView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct ExploreView: View {
    
    let avatar = AvatarModel.mock
    var avatars = AvatarModel.mocks
    
    var body: some View {
        NavigationStack {
            CarouselView(
                items: avatars,
                content: { item in
                    HeroCellView(
                        title: item.name,
                        subtitle: item.characterDescription,
                        imageName: item.profileImageName
                    )
                }
            )
            .frame(height: 200)
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
