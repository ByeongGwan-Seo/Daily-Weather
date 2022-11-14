//
//  CurrentWeatherVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/06.
//

import Foundation
import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject {
    
    @Published var currentWeather: WeatherInformation? = nil
    @Published var searchText: String = ""

    private let currentWeatherService: CurrentWeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init(cityName: String = "tokyo") {
        self.currentWeatherService = CurrentWeatherService(cityName: cityName)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        currentWeatherService.$weatherInfo
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] returnedCurrentWeather in
                self?.currentWeather = returnedCurrentWeather
            })
            .store(in: &cancellables)
    }
    
    func getCurrentWeather(cityName: String) {
        currentWeatherService.getCurrentWeather(cityName: cityName)
    }
    
    
    
   
}
