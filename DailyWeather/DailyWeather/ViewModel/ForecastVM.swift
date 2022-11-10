//
//  ForecastVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import Foundation
import Combine

final class ForeCastViewModel: ObservableObject {
    @Published var forecast: Forecast?

    private let forecastService: ForecastService
    private var cancellables = Set<AnyCancellable>()
    
    init(cityName: String) {
        self.forecastService = ForecastService(cityName: cityName)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        forecastService.$forecastInfo
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] returnedForecast in
                self?.forecast = returnedForecast
            })
            .store(in: &cancellables)
    }
}
