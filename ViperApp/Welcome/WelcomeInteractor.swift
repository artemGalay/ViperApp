//
//  WelcomeInteractor.swift
//  ViperApp
//
//  Created by Артем Галай on 15.09.22.
//

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    func loadDate()
    func loadWeather()

}

class WelcomeInteractor: WelcomeInteractorProtocol {

    weak var presenter: WelcomePresenterProtocol?
    let dataService = DateService()
    let weatherService = WeatherService()

    func loadDate() {
        dataService.getDate { [weak self] date in
            self?.presenter?.didLoad(date: date.description)
        }
    }

    func loadWeather() {
        weatherService.getWeather { [weak self] weather in
            self?.presenter?.didLoad(weather: weather)
        }
    }
}
