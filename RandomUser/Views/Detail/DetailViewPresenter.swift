//
//  DetailViewPresenter.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import Foundation

class DetailViewPresenter: DetailViewPresenterProtocol {
    private let user: User
    
    var avatarURL: URL? {
        URL(string: user.picture.thumbnail)
    }
    @Published var displayedInformation: String
    
    init(user: User) {
        self.user = user
        displayedInformation = ""
        selectInformation(information: .profile)
    }
    
    func selectInformation(information: DisplayedInformation) {
        switch information {
        case .profile:
            displayedInformation = "\(user.name.title) \(user.name.first) \(user.name.last)"
        case .phone:
            displayedInformation = user.phone
        case .mail:
            displayedInformation = user.email
        }
    }
}
