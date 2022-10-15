//
//  CurrentWeatherV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/15.
//

import SwiftUI

struct CurrentWeatherV: View {
    
    @State private var selectedMenu = 1
    @StateObject var vm: CurrentWeatherViewModel
    
    
    var body: some View {
        VStack{
            if let currentWeather = vm.currentWeather {
                
                let maxTempK: Double = currentWeather.temp.maxTemp
                let minTempK: Double = currentWeather.temp.minTemp
                let maxTemp: String = String(format: "%.1f", maxTempK - 273.15)
                let minTemp: String = String(format: "%.1f", minTempK - 273.15)
                
                Text("\(currentWeather.name)")
                    .font(.largeTitle)
                Image(systemName: "sun.max.fill")
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
}

struct CurrentWeatherV_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherV(vm: dev.currentWeatherVM)
    }
}
