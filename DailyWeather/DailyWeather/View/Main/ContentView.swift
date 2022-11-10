//
//  ContentView.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/09/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedMenu = 1
    @EnvironmentObject var vm: CurrentWeatherViewModel

    var body: some View {
        ZStack {
            RadialGradient(colors: [Color(red: 9, green: 9, blue: 121),
                                    Color(red: 0, green: 212, blue: 255)],
                           center: .bottomTrailing,
                           startRadius: 0,
                           endRadius: 35)
            .ignoresSafeArea()
            TabView{
                VStack {
                    Picker(selection: $selectedMenu, label: Text("Picker"), content: {
                        Text("Today").tag(1)
                            .font(.largeTitle)
                        Text("Forecast").tag(2)
                    })
                    .pickerStyle(.segmented)
                    .frame(width: 250)
                    
                    
                    Spacer(minLength: 20)
                    
                    if selectedMenu == 1 {
                        CurrentWeatherV()
                    } else {
                        // TODO: cityName 받아서 넣기
                        ForecastV(cityName: "Seoul")
                    }
                    Spacer()
                }
                .tabItem{
                    Image(systemName: "globe")
                    Text("Main")
                }
                SearchV()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(dev.currentWeatherVM)
    }
}
