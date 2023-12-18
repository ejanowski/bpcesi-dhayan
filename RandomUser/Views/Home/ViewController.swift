//
//  ViewController.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 29/11/2023.
//

import UIKit
import SwiftUI

struct ViewController: View {
    
    @ObservedObject private var presenter = ViewControllerPresenter()
    
    var body: some View {
        NavigationView {
            List(presenter.users, id: \.email) { user in
                NavigationLink(
                    destination: DetailView(presenter: DetailViewPresenter(user: user)),
                    label: {
                        UserCell(user: user)
                    }
                )
            }
            .onAppear {
                presenter.didLoad()
            }
            .navigationTitle("Users")
        }
    }
}

// Définit un aperçu pour la prévisualisation de la vue SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
