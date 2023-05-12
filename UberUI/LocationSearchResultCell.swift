//
//  LocationSearchResultCell.swift
//  UberUI
//
//  Created by Robotics on 10/5/2023.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subTitile: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
                .tint(.white)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.body)
                
                Text(subTitile)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 10)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}
