//
//  ViewController.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 29/11/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ViewControllerPresenterProtocol?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        presenter = ViewControllerPresenter(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let user = presenter?.user(for: indexPath) {
            let presenter = DetailViewPresenter(user: user)
            let detail = DetailView(presenter: presenter)
            let controller = UIHostingController(rootView: detail)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfUsers() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell else { return UITableViewCell() }
        return presenter!.composeCell(for: indexPath, cell: cell)
    }
}

extension ViewController: ViewControllerProtocol {
    func reloadDonnee() {
        tableView.reloadData()
    }
}
