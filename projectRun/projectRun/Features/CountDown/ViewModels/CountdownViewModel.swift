//
//  CountDownViewModel.swift
//  projectRun
//
//  Created by Sebastian Fernandez on 05/11/2021.
//

import Foundation
import Swift
import Combine

class CountdownViewModel: ObservableObject {
    @Published var currentNumber: String
    @Published var finished: Bool

    private var startedAt: Date

    private let countdown: Countdown
    private var timerSubscription: AnyCancellable?

    init(seconds: Int) {
        startedAt = Date()
        currentNumber = String(seconds)
        finished = false

        countdown = Countdown(seconds: seconds)
    }

    func startCountdown() {
        timerSubscription = countdown.start()
            .sink { [weak self] currentNumber in
                guard currentNumber > -1 else {
                    self?.timerSubscription?.cancel()
                    self?.finished = true
                    return
                }

                guard currentNumber > 0 else {
                    self?.currentNumber = String("RUN")
                    return 
                }

                self?.currentNumber = String(currentNumber)
            }
    }
}
