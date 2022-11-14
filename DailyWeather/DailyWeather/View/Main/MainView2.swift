//
//  MainView2.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/10.
//

import SwiftUI

struct MainView2: View {
    
    
    @EnvironmentObject var vm: CurrentWeatherViewModel
    @State private var selectedMenu: Int = 1
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: weatherBackground(weather: vm.currentWeather?.weather?.first?.main ?? . init()),
                           startPoint: .top,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ZStack {
                VStack(spacing: 40) {
                    Picker(selection: $selectedMenu) {
                        Text("Today").tag(1)
                            .font(.largeTitle)
                        Text("Forecast").tag(2)
                        Text("Search").tag(3)
                    } label: {
                        Text("oiu")
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 300)
                    CurrentV2()
                }
            }
        }
    }
    
    func weatherBackground(weather: String) -> [Color] {
        switch weather {
        case "Clear":
            return [Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))]
        case "Clouds":
            return [Color(#colorLiteral(red: 0.6131833196, green: 0.7450816035, blue: 0.9466372132, alpha: 1)), Color(#colorLiteral(red: 0.3644966483, green: 0.5740805268, blue: 0.7990383506, alpha: 1))]
        case "Rain":
            return [Color(#colorLiteral(red: 0.6564016938, green: 0.7317531109, blue: 0.6656756997, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
        case "Snow":
            return [Color(#colorLiteral(red: 0.6745098039, green: 0.7960784314, blue: 0.9333333333, alpha: 1)), Color(#colorLiteral(red: 0.9058823529, green: 0.9411764706, blue: 0.9921568627, alpha: 1))]
        case "Extreme":
            return [Color(#colorLiteral(red: 0.007843137255, green: 0.3137254902, blue: 0.7725490196, alpha: 1)), Color(#colorLiteral(red: 0.831372549, green: 0.2470588235, blue: 0.5529411765, alpha: 1))]
        default:
            return [Color(#colorLiteral(red: 0, green: 0.649317205, blue: 0.933945477, alpha: 1)), Color(#colorLiteral(red: 0.3848685026, green: 0.8256501555, blue: 0.7817828059, alpha: 1))]
        }
    }
}

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView2()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
                .environmentObject(dev.currentWeatherVM)

            MainView2()
                .previewInterfaceOrientation(.portrait)
                .environmentObject(dev.currentWeatherVM)

        }
    }
}

struct CurrentV2: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel
    
    var body: some View {
        
        if let currentWeather2 = vm.currentWeather {
            let maxTempK2: Double = currentWeather2.main?.tempMax ?? 0
            let minTempK2: Double = currentWeather2.main?.tempMin ?? 0
            let maxTemp2:String = String(format: "%.1f", maxTempK2 - 273.15)
            let minTemp2:String = String(format: "%.1f", minTempK2 - 273.15)
            
            VStack(spacing: 80) {
                HStack {
                    Spacer()
                    Text(currentWeather2.name ?? "")
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(minTemp2)°")
                    Text("/")
                        .fontWeight(.bold)
                    Text("\(maxTemp2)°")
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.primary)
                .font(.title)
                
                weatherImage(weather: currentWeather2.weather?.first?.main ?? .init())
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                VStack(spacing: 20) {
                    HStack(alignment: .center, spacing: 30) {
                        HStack {
                            Image(systemName: "figure.stand")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text("Feels like")
                                Text("134")
                            }
                        }
                        .padding()
                        .background()
                        .cornerRadius(20)
                        .frame(width: 160)
                        
                        HStack {
                            Image(systemName: "eye.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text("Visibility")
                                Text("134")
                            }
                        }
                        .padding()
                        .background()
                        .cornerRadius(20)
                        .frame(width: 160)
                    }
                    
                    HStack(alignment: .center, spacing: 30) {
                        HStack {
                            Image(systemName: "figure.stand")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text("Feels like")
                                Text("134")
                            }
                        }
                        .padding()
                        .background()
                        .cornerRadius(20)
                        .frame(width: 160)
                        
                        HStack {
                            Image(systemName: "eye.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text("Visibility")
                                Text("134")
                            }
                        }
                        .padding()
                        .background()
                        .cornerRadius(20)
                        .frame(width: 160)
                    }
                    HStack(alignment: .center, spacing: 30) {
                        HStack {
                            Image(systemName: "figure.stand")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text("Feels like")
                                Text("134")
                            }
                        }
                        .padding()
                        .background()
                        .cornerRadius(20)
                        .frame(width: 160)
                        
                        HStack {
                            Image(systemName: "eye.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text("Visibility")
                                Text("134")
                            }
                        }
                        .padding()
                        .background()
                        .cornerRadius(20)
                        .frame(width: 160)
                    }
                }
            }
        }
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
