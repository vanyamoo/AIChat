//
//  AvatarAttributes.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 07/10/2025.
//

import Foundation

enum CharacterOption: String, CaseIterable, Hashable {
    case man, woman, alien, cat, dog
    
    static var defaultValue: Self {
        .man
    }
    
    var plural: String {
        switch self {
        case .man:
            return "men"
        case .woman:
            return "women"
        case .alien:
            return "aliens"
        case .dog:
            return "dogs"
        case .cat:
            return "cats"
        }
    }
    
    var startsWithVowel: Bool {
        ["a", "e", "i", "o", "u"].contains(rawValue.first!.lowercased())
    }
}

enum CharacterAction: String, CaseIterable, Hashable {
    case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying
    
    static var defaultValue: Self {
        .smiling
    }
}

enum CharacterLocation: String, CaseIterable, Hashable {
    case office, home, park, beach, city, forest, mountain
    
    static var defaultValue: Self {
        .park
    }
}

struct AvatarDescriptionBuilder {
    var characterOption: CharacterOption
    var characterAction: CharacterAction
    var characterLocation: CharacterLocation
    
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .defaultValue
        self.characterAction = avatar.characterAction ?? .defaultValue
        self.characterLocation = avatar.characterLocation ?? .defaultValue
    }
    
    var characterDescription: String {
        let prefix = characterOption.startsWithVowel ? "An" : "A"
        return "\(prefix) \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
}
