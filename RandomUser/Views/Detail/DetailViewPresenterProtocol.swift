//
//  DetailViewPresenterProtocol.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import Foundation

enum DisplayedInformation: CaseIterable {
    case profile
    case mail
    case phone
}

protocol DetailViewPresenterProtocol: ObservableObject {
    var avatarURL: URL? { get }
    var displayedInformation: String { get }
    
    func selectInformation(information: DisplayedInformation)
}
