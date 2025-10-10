//
//  ModalSupportView.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 10/10/2025.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {
    
    @Binding var showModal: Bool
    @ViewBuilder var content: Content
    
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

extension View {
    func showModal(_ showModal: Binding<Bool>, @ViewBuilder content: () -> some View) -> some View {
        self
            .overlay(
                ModalSupportView(showModal: showModal) {
                    content()
                }
            )
    }
}

private struct PreviewView: View {
    
    @State private var showModal = false
    
    var body: some View {
        Button("Click me") {
            showModal = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .showModal($showModal, content: {
            RoundedRectangle(cornerRadius: 30)
                .padding(40)
                .padding(.vertical, 100)
                .onTapGesture {
                    showModal = false
                }
                .transition(.slide)
        })
    }
}

#Preview {
    PreviewView()
}
