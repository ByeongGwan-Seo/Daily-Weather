//
//  SearchListRowV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import SwiftUI

struct SearchListRowV: View {
    
    let item: SearchListM
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(item.title)
            Spacer()
        }
    }
}

struct SearchListRowV_Previews: PreviewProvider {
    
    static var item1 = SearchListM(title: "메우")
    
    static var previews: some View {
        Group {
            SearchListRowV(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
