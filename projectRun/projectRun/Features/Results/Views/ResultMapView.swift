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
    center: CLLocationCoordinate2D(
      latitude: 25.7617,
      longitude: 80.1918
    ),
    span: MKCoordinateSpan(
      latitudeDelta: 10,
      longitudeDelta: 10
    )
  )

  var body: some View {
    Map(coordinateRegion: $region)
  }
}

struct ResultMapView_Previews: PreviewProvider {
  static var previews: some View {
    ResultMapView()
  }
}
