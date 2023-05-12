//
//  HomeView.swift
//  UberUI
//
//  Created by Robotics on 9/5/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState: MapViewState = MapViewState.noInput
    @EnvironmentObject var locationSearchViewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Map View ZStack
            ZStack(alignment: .top) {
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                } else if mapState == .noInput{
                    LocationSearchActivationView()
                        .padding(.top, 75)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 5)
            }
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                locationSearchViewModel.userLocation = location
            }
        }
    }
}
