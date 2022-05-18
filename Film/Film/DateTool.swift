//
//  DateTool.swift
//  Weather
//
//  Created by steven on 2021/12/3.
//


/// 时间类型RowValue
enum TimeFormat:String {
    case YYYYMMDD = "YYYY-MM-dd"
    case YYYYMMDDHH = "YYYY-MM-dd HH"
    case YYYYMMDDHHMM = "YYYY-MM-dd HH:mm"
    case YYYYMMDDHHMMSS = "YYYY-MM-dd'T'HH:mm:ss'Z'"
    case YYYYMMDDHHMMSSsss = "YYYY-MM-dd HH:mm:ss.SSS"
}

import UIKit

class DateTool: NSObject {
    /// 获取当前时间
    /// - Parameter timeFormat: 时间类型，TimeFormat为枚举
    public static func getCurrentTime(timeFormat:TimeFormat) -> String{
//        let lastDay = NSDate.init(timeInterval: TimeInterval(6 * 60 * 60), since: Date.init())
        let day = Date.init()
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat.rawValue
//        let timezone = TimeZone.init(identifier: "America/Los_Angeles")
//        formatter.timeZone = timezone
        let dateTime = formatter.string(from: day)
        return dateTime
    }
    
    /// 获取下一天时间
    /// - Parameters:
    ///   - timeFormat: 时间格式
    ///   - dateString: 当前时间
    public static func getNextDay(timeFormat:TimeFormat,dateString:String,timeInt:Int) -> String {
        let lastDay = NSDate.init(timeInterval: TimeInterval(24 * 60 * 60 * timeInt), since: dateFromString(timeFormat: timeFormat, date: dateString) as Date)
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat.rawValue
        let strDate = formatter.string(from: lastDay as Date)
        return strDate
    }
    
    /// 将字符串转成NSDate类型
    /// - Parameters:
    ///   - timeFormat: 时间分类
    ///   - date: 时间
    public static func dateFromString(timeFormat:TimeFormat,date:String) -> NSDate {
        let formatter = DateFormatter()
        formatter.locale = NSLocale.init(localeIdentifier: "America/Los_Angeles") as Locale
        formatter.dateFormat = timeFormat.rawValue
        let inputDate = formatter.date(from: date)
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT(for: inputDate!)
        let localeDate = inputDate?.addingTimeInterval(TimeInterval(interval))
        return localeDate! as NSDate
    }
    
    /// 获取当前时间戳
    /// - Parameters:
    ///   - timeFormat: 时间类型
    public static func getNowTimeTimestamp(timeFormat:TimeFormat) -> NSInteger {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.dateFormat = timeFormat.rawValue
        let timezone = TimeZone.init(identifier: "America/Los_Angeles")
        formatter.timeZone = timezone
        let dateTime = NSDate.init()
        //这里是秒，如果想要毫秒timeIntervalSince1970 * 1000
//        let timeSp = String(format: "%d", dateTime.timeIntervalSince1970)
//        return timeSp
        return NSInteger(dateTime.timeIntervalSince1970)
    }
}
