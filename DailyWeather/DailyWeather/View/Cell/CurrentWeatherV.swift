//
//  CurrentWeatherV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/17.
//

import SwiftUI

struct CurrentWeatherV: View {
    
    @State private var selectedMenu = 1
    @StateObject var vm: CurrentWeatherViewModel
    
    
    var body: some View {
        VStack {
            if let currentWeather = vm.currentWeather {
                let maxTempK:Double = currentWeather.temp.maxTemp
                let minTempK:Double = currentWeather.temp.minTemp
                let maxTemp:String = String(format: "%.1f", maxTempK - 273.15)
                let minTemp:String = String(format: "%.1f", minTempK - 273.15)
                
                Text("\(currentWeather.name)")
                    .font(.largeTitle)
                weatherImage(weather: currentWeather.weather.first?.main ?? .init())
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                HStack(alignment: .center, spacing: 50) {
                    Text("Max: \(maxTemp)")
                        .font(.title3)
                    Text("Min: \(minTemp)")
                        .font(.title3)
                }
            }
        }
    }
    
    // TODO: イメージ修正
    func weatherImage(weather: String) -> Image {
        switch weather {
        case "Clear":
            return Image(systemName: "sun.max.fill")
        case "Clouds":
            return Image(systemName: "cloud.fill")
        case "Rain":
            return Image(systemName: "cloud.rain.fill")
        case "Snow":
            return Image(systemName: "cloud.snow.fill")
        case "Extreme":
            return Image(systemName: "cloud.bolt.fill")
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
}

struct CurrentWeatherV_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherV(vm: dev.currentWeatherVM)
    }
}
