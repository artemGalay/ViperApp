//
//  WeatherService.swift
//  ViperApp
//
//  Created by Артем Галай on 15.09.22.
//

import Foundation

class WeatherService {
    func getWeather(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let temterature = Int.random(in: -30...30)
            completion(temterature)
        }
    }
}
