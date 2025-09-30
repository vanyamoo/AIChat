//
//  ButtonViewModifiers.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 30/09/2025.
//

import SwiftUI

struct HighlightButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accent.opacity(0.4) : Color.accent.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct PressableButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

extension View {
    
    func hightlightButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HighlightButtonStyle())
    }

    func pressableButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PressableButtonStyle())
    }
}

#Preview {
    VStack {
        Text("Hello, world!")
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .hightlightButton {
                // action
            }
            .padding()
        
        Text("Hello, world!")
            .callToActionButton()
            .pressableButton {
                // action
            }
            .padding()
    }
}
