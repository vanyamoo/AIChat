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

extension View {
    func hightlightButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HighlightButtonStyle())
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
        
        Button(
            action: {
                //
            },
            label: {
                Text("Hello, world!")
                    .callToActionButton()
            }
        )
        .buttonStyle(.plain)
        .padding()
    }
}
