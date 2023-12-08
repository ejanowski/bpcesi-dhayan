//
//  DetailView.swift
//  RandomUser
//
//  Created by JANOWSKI Emeric (BPCE-SI) on 08/12/2023.
//

import SwiftUI

struct DetailView<T>: View where T: DetailViewPresenterProtocol {
    @ObservedObject var presenter: T
    
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: presenter.avatarURL)
            Text(presenter.displayedInformation)
            HStack {
                ForEach(DisplayedInformation.allCases, id: \.self) { information in
                    Button {
                        presenter.selectInformation(information: information)
                    } label: {
                        image(information: information)
                    }
                }
            }
        }
    }
    
    @ViewBuilder func image(information: DisplayedInformation) -> some View {
        switch information {
        case .mail: Image(systemName: "mail")
        case .phone: Image(systemName: "phone")
        case .profile: Image(systemName: "person")
        }
    }
}
