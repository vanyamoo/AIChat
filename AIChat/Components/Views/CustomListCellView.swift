//
//  CustomListCellView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 30/09/2025.
//

import SwiftUI

struct CustomListCellView: View {
    
    var imageName: String = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "An alien that is smiling in the park"
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .cornerRadius(16)
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                 if let subtitle {
                     Text(subtitle)
                         .font(.subheadline)
                }
            }
            .padding(12)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        CustomListCellView()
    }
}
