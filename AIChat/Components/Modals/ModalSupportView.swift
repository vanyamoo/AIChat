//
//  ModalSupportView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 10/10/2025.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {
    
    @Binding var showModal: Bool
    var content: Content
    
    var body: some View {
        ZStack {
            if showModal {
                Color(.black).opacity(0.6)
                    .ignoresSafeArea()
                    .transition(AnyTransition.opacity.animation(.smooth))
                    .onTapGesture {
                        showModal = false
                    }
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            }
        }
        .zIndex(999)
        .animation(.bouncy, value: showModal)
    }
}

private struct PreviewView: View {
    
    @State private var showModal = false
    
    var body: some View {
        Button("Click me") {
            showModal = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            ModalSupportView(
                showModal: $showModal,
                content: Text("wieuhfowyf0ohaff")
                    .background(.red)
                    .transition(.slide)
            )
        )
    }
}

#Preview {
    PreviewView()
}
