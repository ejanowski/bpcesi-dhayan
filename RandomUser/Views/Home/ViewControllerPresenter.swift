//
//  ViewControllerPresenter.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import Foundation
import RxSwift
import UIKit

class ViewControllerPresenter: ObservableObject {
    private let disposeBag = DisposeBag()
    
    @Published var users: [User] = []
    
    @Published var view: ViewControllerProtocol?
    init() {
    }
}

extension ViewControllerPresenter: ViewControllerPresenterProtocol {
 
    func numberOfUsers() -> Int {
        return users.count
    }
    
    func user(for indexPath: IndexPath) -> User {
        users[indexPath.row]
    }
    
    func didLoad() {
        UserProvider()
            .getUsers()
            .observe(on: MainScheduler.instance)
            //Weak Self pour éviter les cycle de rétention
            .subscribe { [weak self] users in
                self?.users = users
                self?.view?.reloadDonnee()
            }
            .disposed(by: disposeBag)
    }
}
