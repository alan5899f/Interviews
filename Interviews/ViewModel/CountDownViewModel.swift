//
//  Date.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation

class CountDownViewModel {

    var timer: Timer?

    var timeIntervalSince1970: TimeInterval = .zero

    var hourCompletion: (Int) -> Void = { _ in }
    var minuteCompletion: (Int) -> Void = { _ in }
    var secondCompletion: (Int) -> Void = { _ in }

    /// dateTimeString 格式為 "yyyy/MM/dd a h:mm"
    func setTimeEnd(_ dateTimeString: String) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"

        dateFormatter.locale = Locale(identifier: "zh_Tw")

        if let date = dateFormatter.date(from: dateTimeString) {
            // 获取时间戳（timeIntervalSince1970）
            timeIntervalSince1970 = date.timeIntervalSince1970

        } else {
            print("日期时间字符串解析失败")
        }
    }

    func setCountDownHour(completion: @escaping (_ hourTime: Int) -> Void) {
        let timeIntervalDifference = timeIntervalSince1970 - Date().timeIntervalSince1970
        let hourTime = Int(timeIntervalDifference) / 3600
        completion(hourTime)
    }

    func setCountDownMinute(completion: @escaping (_ minuteTime: Int) -> Void) {
        let timeIntervalDifference = timeIntervalSince1970 - Date().timeIntervalSince1970
        let minuteTime = (Int(timeIntervalDifference) % 3600) / 60
        completion(minuteTime)
    }

    func setCountDownSecond(completion: @escaping (_ secondTime: Int) -> Void) {
        let timeIntervalDifference = timeIntervalSince1970 - Date().timeIntervalSince1970
        let secondTime = Int(timeIntervalDifference) % 60
        completion(secondTime)
    }

    func bindingStart() {

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }

    func bindingStop() {

        timer?.invalidate()
        timer = nil

    }

}


extension CountDownViewModel {

    @objc private func countDown() {

        print(timeIntervalSince1970, Date().timeIntervalSince1970,  timeIntervalSince1970 - Date().timeIntervalSince1970)

        setCountDownHour { [weak self] hourTime in
            self?.hourCompletion(hourTime)
        }

        setCountDownMinute { [weak self] minuteTime in
            self?.minuteCompletion(minuteTime)
        }

        setCountDownSecond { secondTime in
            self.secondCompletion(secondTime)
        }

    }

}
