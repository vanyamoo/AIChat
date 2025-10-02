//
//  ChatRowCellViewBuilder.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 02/10/2025.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var chatMessage: ChatMessageModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: avatar?.name,
            subheadline: lastChatMessage?.authorId,
            hasNewChat: hasNewChat
        )
        .task {
            // run a function to get the avatar
            avatar = await getAvatar()
            
            // run a function to fetch the last chat message
            lastChatMessage = await getLastChatMessage()
        }
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        
        return lastChatMessage.hasBeenSeenBy(userId: currentUserId)
    }
}

#Preview {
    ChatRowCellViewBuilder(chat: .mock, getAvatar: {
        .mock
    }, getLastChatMessage: {
        .mock
    })
}
