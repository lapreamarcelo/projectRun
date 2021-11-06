//
//  CountDownViewModel.swift
//  projectRun
//
//  Created by Sebastian Fernandez on 05/11/2021.
//

import Foundation
import Swift
import Combine

class CountDownViewModel: ObservableObject {
    @Published var currentNumber: String
    @Published var running: Bool

    private var startedAt: Date

    private let countdown: Countdown
    private var timerSubscription: AnyCancellable?

    init(seconds: Int) {
        startedAt = Date()
        currentNumber = String(seconds)
        running = false

        countdown = Countdown(seconds: seconds)
    }

    func startCountdown() {
        running = true
        timerSubscription = countdown.start()
            .sink { [weak self] currentNumber in
                guard currentNumber > 0 else {
                    self?.timerSubscription?.cancel()
                    self?.currentNumber = String("0")
                    self?.running = false
                    return
                }

                self?.currentNumber = String(currentNumber)
            }
    }
}
