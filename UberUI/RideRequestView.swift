//
//  RideRequestView.swift
//  UberUI
//
//  Created by Robotics on 10/5/2023.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var locationSearchViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // trip info view
            HStack {
                
                // Indicator View...
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                }
                
                // Info About Trip...
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current Location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(locationSearchViewModel.pickupTime ?? "--:-- -- PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        if let location = locationSearchViewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        Spacer()
                        
                        Text(locationSearchViewModel.dropOffTime ?? "--:-- -- PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 10)
            }
            .padding()
            
            Divider()
            
            // ride type selection view
            Text("Suggested rides")
                .textCase(.uppercase)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(RideType.allCases) { rideType in
                        VStack(alignment: .leading) {
                            Image(rideType.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(rideType.description)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text(locationSearchViewModel.computeRidePrice(forType: rideType).toCurrency() + " MAD")
                                    .font(.system(size: 12, weight: .semibold))
                                
                            }
                            .padding()
                        }
                        .frame(width: 120, height: 160)
                        .background(rideType == selectedRideType ? Color(.systemBlue) : Color.theme.secondaryBackgroundColor)
                        .foregroundColor(rideType == selectedRideType ? .white : Color.theme.primaryTextColor)
                        .scaleEffect(rideType == selectedRideType ? 1.2 : 1, anchor: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = rideType
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 10)
            
            // payment option view
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(Color(.systemBlue))
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("••••• 6434")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color.theme.secondaryBackgroundColor)
            .cornerRadius(10)
            .padding(.horizontal)
            
            // request ride button
            Button {
                // TODO: Nothing for know
            } label: {
                Text("Confirm ride")
                    .textCase(.uppercase)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(11)
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 35)
        .background(Color.theme.backgroundColor)
        .cornerRadius(25)
    }
}
