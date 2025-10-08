//
//  ChatView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 08/10/2025.
//

import SwiftUI

struct ChatView: View {
    
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel? = .mock
    @State private var currentUser: UserModel? = .mock
    
    @State private var textFieldText: String = ""
    @State private var scrollPosition: String?
    
    @State private var showChatSettings: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection
            textFieldSection
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .anyButton {
                        onChatSettingsPressed()
                    }
            }
        }
        .confirmationDialog("", isPresented: $showChatSettings) {
            Button("Report User / Chat", role: .destructive) {
                
            }
            Button("Delete Chat", role: .destructive) {
                
            }
        } message: {
            Text("What would you like to do?")
        }
        
    }
    
    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: isCurrentUser ? nil : avatar?.profileImageName
                    )
                    .id(message.id)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
        }
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }
    
    private var textFieldSection: some View {
        TextField("Say something...", text: $textFieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.accent)
                    .padding(.trailing, 4)
                    .anyButton {
                        onSendMessagePressed()
                    }
                , alignment: .trailing)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(.systemBackground))
                    
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
            )
            .padding(.vertical, 6)
            .padding(.horizontal, 20)
            .background(Color(.secondarySystemBackground))
    }
    
    private func onSendMessagePressed() {
        guard let currentUser else { return }
        
        let content = textFieldText
        
        let message = ChatMessageModel(
            id: UUID().uuidString,
            chatId: UUID().uuidString,
            authorId: currentUser.userId ,
            content: content,
            seenByIds: nil,
            dateCreated: .now
        )
        
        chatMessages.append(message)
        
        scrollPosition = message.id
        
        textFieldText = ""
    }
    
    private func onChatSettingsPressed() {
        showChatSettings = true
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
