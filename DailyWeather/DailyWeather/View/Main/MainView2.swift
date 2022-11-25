//
//  MainView2.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/10.
//

import SwiftUI

struct MainView2: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel
    @EnvironmentObject var foreVm: ForeCastViewModel
    @State private var selectedMenu: Int = 1
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                colors: vm.getCurrentWeatherBack(cityName: vm.searchText),
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
                    
                    ScrollView(showsIndicators: false) {
                        switch selectedMenu {
                        case 1:
                            CurrentV2()
                        case 2:
                            ForecastV()
                        case 3:
                            SearchV2()
                        default:
                            CurrentV2()
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            }
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
            VStack(spacing: 40) {
                HStack {
                    Spacer()
                    Text(vm.currentWeather?.name ?? "")
                        .fontWeight(.heavy)
                    Spacer()
                    Text(vm.getCurrentMinTemp(cityName: vm.searchText))
                    Text("/")
                        .fontWeight(.bold)
                    Text(vm.getCurrentMaxTemp(cityName: vm.searchText))
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.primary)
                .font(.title)
                
                vm.getCurrentWeatherDesc(cityName: vm.searchText)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                CurrentDetailV(cityName: vm.searchText)
            }
    }
}
