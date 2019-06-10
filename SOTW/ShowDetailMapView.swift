//
//  ShowDetailMapView.swift
//  SOTW
//
//  Created by Daniel Saewitz on 6/10/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI
import MapKit

struct ShowDetailMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct ShowDetailMapView_Preview: PreviewProvider {
    static var previews: some View {
        ShowDetailMapView()
    }
}
