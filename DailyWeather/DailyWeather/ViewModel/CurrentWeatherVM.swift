//
//  CurrentWeatherVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/06.
//

import Foundation

func getCurrentWeather(cityName: String) {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=62cbe212a87167152e0493c513f437c7") else { return }
    let session = URLSession(configuration: .default)
    session.dataTask(with: url) {data, response, error in
        guard let data = data, error == nil else { return }
        let decoder = JSONDecoder()
        let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)
        debugPrint(weatherInformation)
    }.resume()
}
