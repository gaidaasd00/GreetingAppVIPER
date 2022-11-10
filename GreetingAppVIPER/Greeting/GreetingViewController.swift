//
//  GreetingViewController.swift
//  GreetingAppVIPER
//
//  Created by Алексей Гайдуков on 10.11.2022.
//

import UIKit
protocol GreetingViewInputProtocol: AnyObject {
    func setGreeting(_ greeting: String)
}

protocol GreetingViewOutputProtocol {
    init(view: GreetingViewInputProtocol)
    func didTapShowGreeting()
}


class GreetingViewController: UIViewController {
   
    @IBOutlet var greetingLabel: UILabel!
    var presenter: GreetingViewOutputProtocol!
    
    
    private var person: Person!
    private let configurator: GreetingConfiguratorInputProtocol = GreetingConfigurator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(withView: self)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        presenter.didTapShowGreeting()
    }
}

//MARK: - GreetingViewInputProtocol
extension GreetingViewController: GreetingViewInputProtocol {
    func setGreeting(_ greeting: String) {
        greetingLabel.text = greeting
    }
}
