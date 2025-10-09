//
//  Binding+EXT.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 09/10/2025.
//

import SwiftUI

extension Binding where Value == Bool {
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init(
            get: {
                value.wrappedValue != nil
            },
            set: { newValue in
                if !newValue {
                    value.wrappedValue = nil
                }
            }
        )
    }
}
