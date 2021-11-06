//
//  CountDown.swift
//  projectRun
//
//  Created by Sebastian Fernandez on 05/11/2021.
//

import Foundation
import Combine

class Countdown {
    private let seconds: Int
    private let startedAt = Date()
    private var timer = Timer.publish(every: 1, on: .main, in: .default)

    init(seconds: Int) {
        self.seconds = seconds
    }

    func start() -> AnyPublisher<Int, Never> {
        timer.autoconnect()
            .map { [weak self] _ in
                guard let self = self else { return 0 }

                let calendar = Calendar(identifier: .gregorian)
                let components = calendar
                    .dateComponents([.second]
                                    ,from: self.startedAt,
                                    to: Date())

                return self.seconds - (components.second ?? 0)
        }.eraseToAnyPublisher()
    }
}
