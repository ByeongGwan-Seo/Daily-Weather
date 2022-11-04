//
//  CurrentWeatherService.swift
//  DailyWeather
//
//  Created by 金峻聖 on 2022/10/13.
//

import Foundation
import Combine

class CurrentWeatherService {
    
    @Published var weatherInfo: WeatherInformation?
    
    private var coinSubscription: AnyCancellable?

    init(cityName: String) {
        getCurrentWeather(cityName: cityName)
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=62cbe212a87167152e0493c513f437c7") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: WeatherInformation.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] weatherInfo in
                self?.weatherInfo = weatherInfo
                self?.coinSubscription?.cancel()
            })
    }
}
