//
//  UserProvider.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 30/11/2023.
//

import Foundation
import RxSwift
import RxCocoa

class UserProvider {
    func getUsers() -> Single<[User]> {
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else {
            return .error(NetworkError.genericError)
        }
        let request = URLRequest(url: url)
        return URLSession.shared.rx.data(request: request)
            .map {
                try JSONDecoder().decode(UserResult.self, from: $0).results
            }
            .take(1)
            .asSingle()
    }
}
