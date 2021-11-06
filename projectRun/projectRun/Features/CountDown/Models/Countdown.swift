//
//  CountDown.swift
//  projectRun
//
//  Created by Sebastian Fernandez on 05/11/2021.
//

import Foundation
import Combine

class Countdown {
    private var seconds: Int
    private let startedAt = Date()
    private var timer = Timer.publish(every: 1, on: .main, in: .default)

    init(seconds: Int) {
        self.seconds = seconds
    }

    func start() -> AnyPublisher<Int, Never> {
        timer.autoconnect()
            .map { [weak self] _ in
                guard let self = self else { return 0 }

                if self.seconds > 0 {
                    self.seconds -= 1
                }

                return self.seconds
        }.eraseToAnyPublisher()
    }
}
