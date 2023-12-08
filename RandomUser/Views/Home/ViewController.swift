//
//  ViewController.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 29/11/2023.
//

import UIKit

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
