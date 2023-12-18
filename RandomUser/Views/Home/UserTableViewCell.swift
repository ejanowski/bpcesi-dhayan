//
//  UserTableViewCell.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import Foundation
import SwiftUI

public struct UserCell: View {
    let user: User
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(user.name.first) \(user.name.last)")
                .font(.headline)
            Text(user.gender.rawValue)
                .font(.subheadline)
        }
        .padding(8)
    }
}
