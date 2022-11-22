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
                
                let city = forecastWeather.city?.name ?? "none"
                Text(vm.getMaxTempCelcius())
                Text(vm.getMinTempCelcius())
                Text(city)
                
            }
        }
    }
}

struct ForecastVRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastVRow()
            .previewLayout(.fixed(width: 390, height: 80))
            .environmentObject(ForeCastViewModel())
    }
}
