//
//  GreetingConfigurator.swift
//  GreetingAppVIPER
//
//  Created by Алексей Гайдуков on 10.11.2022.
//

import Foundation

protocol GreetingConfiguratorInputProtocol {
    func configure(withView view: GreetingViewController)
}

class GreetingConfigurator: GreetingConfiguratorInputProtocol {
    func configure(withView view: GreetingViewController) {
        let presenter = GreetingPresenter(view: view)
        let interactor = GreetingIneractor(presenter: presenter)
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
