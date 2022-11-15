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

    //bool로 파라미터값을 선언하고
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
    }
}


extension WelcomeV {
    private var confirmBtn: some View {
        Button{
            //modal로 contentView 호출
            //여기에다가 showNextPage를 true로 변경해주는
            showNextPage.toggle()
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
}
////error타입 정의
//enum TestError: Error {
//    case text_nil
//}
////예외 처리 오류가 나는 조건
//func getNextViewAndThrows(inputText: String) throws -> Int {
//    guard inputText != nil else {
//        throw TestError.text_nil
//    }
//}
