//
//  ViewControllerPresenter.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import Foundation
import RxSwift

class ViewControllerPresenter {
    private let disposeBag = DisposeBag()
    
    var users: [User] = []
    
    var view: ViewControllerProtocol?
    init(view: ViewController) {
        self.view = view
    }
}

extension ViewControllerPresenter: ViewControllerPresenterProtocol {
    func composeCell(for index: IndexPath, cell: UserTableViewCell) -> UserTableViewCell {
        let user = users[index.row]
    
        cell.titleLabel.text = user.name.first + " " + user.name.last
        cell.subtitleLabel.text = user.gender.rawValue
        
        return cell
    }
    
    func numberOfUsers() -> Int {
        return users.count
    }
    
    func didLoad() {
        UserProvider()
            .getUsers()
            .observe(on: MainScheduler.instance)
            .subscribe {
                self.users = $0
                self.view!.reloadDonnee()
            }
            .disposed(by: disposeBag)
    }
}
