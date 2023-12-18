//
//  ViewControllerProtocol.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import Foundation

protocol ViewControllerProtocol: AnyObject {
    func reloadDonnee()
}

protocol ViewControllerPresenterProtocol {
    func didLoad()
    func numberOfUsers() -> Int
}

