//
//  WelcomePresenter.swift
//  ViperApp
//
//  Created by Артем Галай on 15.09.22.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didTapImageButton()
    func didLoad(date: String?)
    func didLoad(weather: Int?)
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol
    var interactor: WelcomeInteractorProtocol

    init(interactor: WelcomeInteractorProtocol, router: WelcomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {

    func viewDidLoaded() {
        interactor.loadDate()
        interactor.loadWeather()
    }

    func didTapImageButton() {
        let temperature = interactor.temperature
        router.openImage(for: temperature)
    }

    func didLoad(date: String?) {
        view?.showDate(date: date ?? "No date")
    }

    func didLoad(weather: Int?) {
        let temperature = weather?.description ?? "No temperatupe"
        view?.showWeather(weather: temperature)
    }    
}
