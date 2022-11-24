//
//  WelcomeV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/25.
//

import SwiftUI

struct WelcomeV: View {
    
    @State var searching = false
    @EnvironmentObject var vm: CurrentWeatherViewModel
    @EnvironmentObject var lvm: SearchListVM
    @EnvironmentObject var foreVM: ForeCastViewModel

    @State var showNextPage = false
    
    var body: some View {
        VStack {
            contentsSection
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .foregroundColor(.white)
    }
}

struct WelcomeV_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeV()
            .environmentObject(dev.currentWeatherVM)
            .environmentObject(SearchListVM())
            .environmentObject(ForeCastViewModel())
    }
}

extension WelcomeV {
    private var contentsSection: some View {
        VStack (spacing: 30){
            Text(L10n.Localizable.welcomeMainTitle)
                .bold().font(.title)
            Text("welcome_confirm_title")
                .bold()
                .padding()
            Text("welcome_caution_description")
                .font(.caption)
            HStack{
                SearchBar(searchText: $vm.searchText, searching: $searching)
                
                confirmBtn
            }
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var confirmBtn: some View {
        Button{
            showNextPage.toggle()
            lvm.addItem(title: vm.searchText)
            vm.getCurrentWeather(cityName: vm.searchText)
            foreVM.getForecastweather(cityName: vm.searchText)
        } label: {
            Text("welcome_confirm_button_title")
        }
        .padding()
        .background(.white)
        .foregroundColor(.blue)
        .cornerRadius(13)
        //파라미터로
        .fullScreenCover(isPresented: $showNextPage) {
            MainView2()
                .environmentObject(vm)
        }
    }
}

