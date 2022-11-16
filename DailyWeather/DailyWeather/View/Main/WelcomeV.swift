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
    }
}

extension WelcomeV {
    private var contentsSection: some View {
        VStack (spacing: 30){
            Text("Daily Weatherへようこそ")
                .bold().font(.title)
            Text("確認したい地域の地名をご記入ください")
                .bold()
                .padding()
            Text("※ 都市名は英語でご記入お願い致します")
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
        } label: {
            Text("確認")
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

