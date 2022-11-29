//
//  SearchListRowV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import SwiftUI

struct SearchListRowV: View {
    
    let item: SearchListM
    let clickRow: () -> ()
    
    var body: some View {
        HStack {
            Image(systemName: L10n.Resources.Image.circle)
                .font(.caption)
            Text(item.title)
            Spacer()
        }
        .onTapGesture {
            clickRow()
        }
    }
}

struct SearchListRowV_Previews: PreviewProvider {
    
    static var item1 = SearchListM(title: "메우")
    
    static var previews: some View {
        Group {
            SearchListRowV(item: item1, clickRow: {})
        }
        .previewLayout(.sizeThatFits)
    }
}
