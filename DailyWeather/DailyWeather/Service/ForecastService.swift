//
//  ForecastService.swift
//  DailyWeather
//
//  Created by 金峻聖 on 2022/11/10.
//

import Foundation
import Combine

class ForecastService {
    
    @Published var forecastInfos: [Forecast]?

    private var coinSubscription: AnyCancellable?

    init(cityName: String) {
        getForecast(cityName: cityName)
    }

    func getForecast(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=62cbe212a87167152e0493c513f437c7") else { return }

        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [Forecast].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] forecastInfos in
                self?.forecastInfos = forecastInfos
                self?.coinSubscription?.cancel()
            })
    }
}
