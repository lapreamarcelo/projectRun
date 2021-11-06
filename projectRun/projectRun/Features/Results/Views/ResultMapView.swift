//
//  ResultMapView.swift
//  projectRun
//
//  Created by Libranner Leonel Santos Espinal on 5/11/21.
//

import MapKit
import SwiftUI

struct ResultMapView: View {
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
    latitudinalMeters: 750,
    longitudinalMeters: 750
  )

  var body: some View {
    Map(coordinateRegion: $region)
      .ignoresSafeArea()
  }
}

struct ResultMapView_Previews: PreviewProvider {
  static var previews: some View {
    ResultMapView()
  }
}
