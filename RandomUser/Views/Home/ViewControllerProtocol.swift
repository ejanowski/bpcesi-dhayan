//
//  ViewControllerProtocol.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import Foundation

protocol ViewControllerProtocol {
    func reloadDonnee()
}

protocol ViewControllerPresenterProtocol {
    func didLoad()
    func numberOfUsers() -> Int
    func composeCell(for index: IndexPath, cell: UserTableViewCell) -> UserTableViewCell
    func user(for indexPath: IndexPath) -> User
}

