//
//  CurrentDetailV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/24.
//

import SwiftUI

struct CurrentDetailV: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel

    var cityName: String
    
    var body: some View {
        detailArea
    }
}

struct CurrentDetailV_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDetailV(cityName: "Tokyo")
            .environmentObject(CurrentWeatherViewModel())
    }
}

extension CurrentDetailV {
    private var detailArea: some View {
        VStack(spacing: 25) {
            detailRowTop
            detailRowBot
        }
    }
    
    private var detailRowTop: some View {
        HStack(spacing: 25) {
            CurrenDetailCell(systemName: "person.fill", description: "Feels Like", function: vm.getCurrentFeelTemp(cityName: cityName))
            CurrenDetailCell(systemName: "humidity", description: "Humidity", function: vm.getCurrentFeelTemp(cityName: cityName))
        } 
    }
    
    private var detailRowBot: some View {
        HStack(spacing: 25) {
            CurrenDetailCell(systemName: "speedometer", description: "Atmo. Pressure", function: vm.getCurrentFeelTemp(cityName: cityName))
            CurrenDetailCell(systemName: "wind", description: "Wind Speed", function: vm.getCurrentFeelTemp(cityName: cityName))
        }
    }
}
