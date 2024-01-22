//
//  LocationPicker.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 19/01/24.
//

import SwiftUI
import MapKit

struct LocationPicker: View {
    @State private var region: MKCoordinateRegion = .init()
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}

#Preview {
    LocationPicker()
}
