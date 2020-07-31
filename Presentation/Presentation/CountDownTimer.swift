//
// Created by Shaban Kamel on 16/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public protocol CountDownDelegate {
    func onTick(timeLeft: DateComponents, currentDate: Date, eventDate: Date)
    func onFinish(currentDate: Date, eventDate: Date)
}

public class CountDownTimer {
    private var timer: Timer!
    private var eventDate: Date!
    public var delegate: CountDownDelegate?

    public init() {}

    public func start(eventDate: DateComponents) {
        self.eventDate = Calendar.current.date(from: eventDate)!
        start()
    }

    public func start(eventDate: Date) {
        self.eventDate = eventDate
        start()
    }

    private func start() {
        // Repeat "func Update() " every second and call the delegate
        timer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(updateTime),
                userInfo: nil,
                repeats: true
        )
    }

    @objc func updateTime() {
        let userCalendar = Calendar.current

        // Set Current Date
        let date = Date()
        let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
        let currentDate = userCalendar.date(from: components)!

        // Change the date to days, hours, minutes and seconds
        let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)

        delegate?.onTick(timeLeft: timeLeft, currentDate: currentDate, eventDate: eventDate)

        // finish timer if needed
        if currentDate >= eventDate {
            timer.invalidate()
            delegate?.onFinish(currentDate: currentDate, eventDate: eventDate)
        }
    }

}