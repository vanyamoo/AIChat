//
//  ImageLoaderView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 23/09/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = "https://picsum.photos/600/600"
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        WebImage(url: URL(string: urlString))
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: resizingMode)
    }
}

#Preview {
    ImageLoaderView()
}
