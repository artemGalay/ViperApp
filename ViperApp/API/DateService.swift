//
//  DateService.swift
//  ViperApp
//
//  Created by Артем Галай on 15.09.22.
//

import Foundation

class DateService {
    func getDate(completion: @escaping (Date) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(Date())
        }
    }
}
