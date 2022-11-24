//
//  ForecastVRow.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastVRow: View {
    
    @EnvironmentObject var vm: ForeCastViewModel
    
    
    var index: Int

    var body: some View {
        
            rowSection
       
    }
}

//struct ForecastVRow_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ForecastVRow(weather: vm.forecast?.list?.first., humidity: <#T##Int#>, feelsLike: <#T##Double#>, windSpeed: <#T##Double#>)
//            .environmentObject(dev.forecastWeatherVM)
//    }
//}

extension ForecastVRow {


    private var rowSection: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("대충날짜")
                    .font(.headline)
                Spacer()
                vm.getForecastMainDesc(index: index)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Spacer()
                Text(vm.getMinTempCelcius(index: index))
                Text("/")
                Text(vm.getMaxTempCelcius(index: index))
                Spacer()
            }
            .padding(.horizontal)
            Divider()
            HStack {
                VStack(spacing: 10) {
                    Text("湿度")
                    Text(vm.getForecastHumidity(index: index))
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("体感温度")
                    Text(vm.getForecastFeelsLike(index: index))
                }
                Spacer()
                VStack(spacing: 10) {
                    Text("風速")
                    Text(vm.getForecastWindSpeed(index: index))
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors:[ Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(30)
        .padding()
        .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
    
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
