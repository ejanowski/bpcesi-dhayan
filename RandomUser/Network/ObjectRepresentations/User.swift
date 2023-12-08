//
//  User.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 30/11/2023.
//

import Foundation

class UserResult: Codable {
    let results: [User]
}

class User: Codable {
    let gender: Gender
    let name: Name
    let email: String
    let phone: String
    let picture: Picture
    
    private enum CodingKeys : String, CodingKey {
        case gender, name, email, phone, picture
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(Name.self, forKey: .name)
        gender = (try? container.decode(Gender.self, forKey: .gender)) ?? .other
        email = try container.decode(String.self, forKey: .email)
        phone = try container.decode(String.self, forKey: .phone)
        picture = try container.decode(Picture.self, forKey: .picture)
    }
}
