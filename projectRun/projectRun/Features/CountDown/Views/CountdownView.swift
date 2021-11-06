//
//  CountDownView.swift
//  projectRun
//
//  Created by Sebastian Fernandez on 05/11/2021.
//

import SwiftUI

struct CountdownView: View {
    @ObservedObject var viewModel: CountDownViewModel

    var body: some View {
        Text("\(viewModel.currentNumber)")
            .font(.system(size: 80))
            .fontWeight(.bold)
            .foregroundColor(.orange)
            .onAppear(perform: viewModel.startCountdown)
    }
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountdownView(viewModel: CountDownViewModel(seconds: 3))
                .previewDevice("iPhone 12")
        }
    }
}
