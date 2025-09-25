//
//  AvatarModel.swift
//  AIChat
//
//  Created by Vanya Mutafchieva on 25/09/2025.
//

import Foundation

struct AvatarModel {
    
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
}

enum CharacterOption {
    case man, woman, alien, cat, dog
}

enum CharacterAction {
    case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying
}

enum CharacterLocation {
    case office, home, park, beach, city, forest, mountain
}
