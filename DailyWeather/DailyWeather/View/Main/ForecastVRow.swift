//
//  ForecastVRow.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastVRow: View {
    
    @EnvironmentObject var vm: ForeCastViewModel
    
    
    var body: some View {
        VStack {
            if let forecastWeather = vm.forecast {
                let maxTempK: Double = forecastWeather.list?.first?.main?.tempMax ?? 0
                let minTempK: Double = forecastWeather.list?.first?.main?.tempMin ?? 0
                let maxTemp: String = String(format: "%.1f", maxTempK - 273.15)
                let minTemp: String = String(format: "%.1f", minTempK - 273.15)
                let city = forecastWeather.city?.name ?? ""
//
                VStack {
                    Text(maxTemp)
                    Text(minTemp)
                    Text(city)
                }
            }
//            Text(vm.getMaxTempCelcius(maxTemp: <#T##Double#>))
//            Text(vm.getMinTempCelcius(minTemp: <#T##Double#>))
        }
    }
}

struct ForecastVRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastVRow()
            .previewLayout(.fixed(width: 390, height: 80))
    }
}
