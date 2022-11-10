//
//  GreetingPresenter.swift
//  GreetingAppVIPER
//
//  Created by Алексей Гайдуков on 10.11.2022.
//

import Foundation

struct GreetingData {
    let name: String
    let surname: String
}

class GreetingPresenter: GreetingViewOutputProtocol {
    unowned private let view: GreetingViewInputProtocol
    var interactor: GreetingInteractorInputProtocol!
    
    required init(view: GreetingViewInputProtocol) {
        self.view = view
    }
    
    func didTapShowGreeting() {
        interactor.provideGreetingData()
    }
}

//MARK: - GreetingInteractorOutputProtocol
extension GreetingPresenter: GreetingInteractorOutputProtocol {
    func receiveGreetingData(greetingData: GreetingData) {
        let greeting = "Hello \(greetingData.name) \(greetingData.surname)!"
        view.setGreeting(greeting)
    }
}
