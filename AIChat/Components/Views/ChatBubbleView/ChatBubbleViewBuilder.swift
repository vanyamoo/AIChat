//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 08/10/2025.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?
    var onImagePressed: (() -> Void)?
    
    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : Color(.systemGray6),
            showImage: !isCurrentUser,
            imageName: imageName,
            onImagePressed: onImagePressed
        )
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? 75 : 0)
        .padding(.trailing, isCurrentUser ? 0 : 75)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "This is some longer content that goes on to multiple lines and keeps on going to another line!",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true,
                imageName: Constants.randomImage
            )
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "This is some longer content that goes on to multiple lines and keeps on going to another line!",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: false,
                imageName: Constants.randomImage
            )
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel.mock,
                isCurrentUser: true,
                imageName: Constants.randomImage
            )
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel.mock,
                isCurrentUser: false,
                imageName: Constants.randomImage
            )
        }
        .padding(12)
    }
}
