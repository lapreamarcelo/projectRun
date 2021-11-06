//
//  CountDownView.swift
//  projectRun
//
//  Created by Sebastian Fernandez on 05/11/2021.
//

import SwiftUI

struct CountdownView: View {
    @ObservedObject var viewModel: CountdownViewModel

    var body: some View {
        Text("\(viewModel.currentNumber)")
            .font(Double(viewModel.currentNumber) == Double.nan ? .system(size: 60) : .system(size: 80))
            .italic()
            .bold()
            .foregroundColor(.orange)
            .onAppear(perform: viewModel.startCountdown)
    }
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountdownView(viewModel: CountdownViewModel(seconds: 3))
                .previewDevice("iPhone 12")
        }
    }
}
