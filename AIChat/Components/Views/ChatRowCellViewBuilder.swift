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
    
    @State private var didloadAvatar: Bool = false
    @State private var didLoadChatMessage: Bool = false
    
    private var isLoading: Bool {
        didloadAvatar == false || didLoadChatMessage == false
    }
    
    private var subheadline: String? {
        if isLoading {
            return "xxxx xxxx xxxx xx xxxxxxx"
        }
        
        if avatar == nil && lastChatMessage == nil {
            return "Error"
        }
        
        return lastChatMessage?.content
    }
    
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxxx xxxx" : avatar?.name,
            subheadline: subheadline,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            // run a function to get the avatar
            avatar = await getAvatar()
            didloadAvatar = true
            
            // run a function to fetch the last chat message
            lastChatMessage = await getLastChatMessage()
            didLoadChatMessage = true
        }
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        
        return lastChatMessage.hasBeenSeenBy(userId: currentUserId)
    }
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }, getLastChatMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        })
        
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            .mock
        }, getLastChatMessage: {
            .mock
        })
    }
}
