//
//  ChatRowCellView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 01/10/2025.
//

import SwiftUI

struct ChatRowCellView: View {
    
    var imageName: String? = Constants.randomImage
    var headline: String? = "Alpha"
    var subheadline: String? = "This is the last message in the chat. And it's very long"
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                        .aspectRatio(contentMode: .fit)
                        
                } else {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                        
                }
                
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NEW")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(6)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(.systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        List {
            ChatRowCellView()
                .removeListRowFormatting()
            
            ChatRowCellView(imageName: nil)
                .removeListRowFormatting()
            
            ChatRowCellView(hasNewChat: false)
                .removeListRowFormatting()
            
            ChatRowCellView(headline: nil, hasNewChat: false)
                .removeListRowFormatting()
            
            ChatRowCellView(subheadline: nil, hasNewChat: false)
                .removeListRowFormatting()
        }
    }
}
