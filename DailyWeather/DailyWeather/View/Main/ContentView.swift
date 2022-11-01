//
//  ContentView.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/09/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedMenu = 1
    @StateObject var vm: CurrentWeatherViewModel

    var body: some View {
        TabView{

            VStack(spacing: 30) {
                Picker(selection: $selectedMenu, label: Text("Picker"), content: {
                    Text("Today").tag(1)
                        .font(.largeTitle)
                        .font(.largeTitle)
                    Text("Forecast").tag(2)
                })
                .pickerStyle(.segmented)
                .frame(width: 250)
                .padding()
                
                Spacer(minLength: 10)
                
                if selectedMenu == 1 {
                    CurrentWeatherV(vm: vm)
                } else {
                    Text("Forecast Here")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: dev.currentWeatherVM)
    }
}
