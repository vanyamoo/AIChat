//
//  TextValidationHelper.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 09/10/2025.
//

import Foundation

enum TextValidationError: LocalizedError {
    case tooShort(min: Int)
    case containsBadWord
    
    var errorDescription: String? {
        switch self {
        case .tooShort(let minimumCharacters):
            return "Please add at least \(minimumCharacters) characters"
        case .containsBadWord:
            return "Please avoid using inappropriate language"
        }
    }
}

struct TextValidationHelper {
    static func checkIfTextIsValid(_ text: String) throws {
        let minimumCharacterCount = 3
        if text.count < minimumCharacterCount {
            throw TextValidationError.tooShort(min: minimumCharacterCount)
        }
        let badWords = ["badword1", "badword2", "badword3"]
        
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.containsBadWord
        }
    }
    
}
