//
//  ChatBubbleView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 08/10/2025.
//

import SwiftUI

struct ChatBubbleView: View {
    
    var text: String = ""
    var textColor: Color = .white
    var backgroundColor: Color = .accentColor
    var showImage: Bool = true
    var imageName: String?
    var onImagePressed: (() -> Void)?
    
    let offset: CGFloat = 14
    
    var body: some View {
        HStack(alignment: .top) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                            .anyButton {
                                onImagePressed?()
                            }
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .offset(y: offset)
            }
            
            Text(text)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(backgroundColor)
                .foregroundStyle(textColor)
                .cornerRadius(6)
        }
        .padding(.bottom, showImage ? offset : 0)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView(
                text: "Hello, how are you?",
                textColor: .white,
                backgroundColor: .accent,
                showImage: false
            )
            
            ChatBubbleView(
                text: "Good, I haven't seen you in a long long long time, how have you been?",
                textColor: .primary,
                backgroundColor: Color(.systemGray6)
            )
            
            ChatBubbleView(
                text: "Not bad, I was just doing some work and then I saw you in the hallway. I'm sorry, I didn't mean to disturb you.",
                textColor: .white,
                backgroundColor: .accent,
                showImage: false
            )
            
            ChatBubbleView(
                text: "No bother at all, I'm just here to help. What can I do for you?",
                textColor: .primary,
                backgroundColor: Color(.systemGray6)
            )
        }
    }
}
