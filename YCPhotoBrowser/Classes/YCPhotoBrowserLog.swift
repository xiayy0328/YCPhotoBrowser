//
//  YCPhotoBrowserLog.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import Foundation

public struct YCPhotoBrowserLog {
    
    /// 日志重要程度等级
    public enum Level: Int {
        case low = 0
        case middle
        case high
        case forbidden
    }
    
    /// 允许输出日志的最低等级。`forbidden`为禁止所有日志
    public static var minimumLevel: Level = .forbidden
    
    public static func low(_ item: @autoclosure () -> Any) {
        if minimumLevel.rawValue <= Level.low.rawValue {
            print("[YCPhotoBrowser] [low]", item())
        }
    }
    
    public static func middle(_ item: @autoclosure () -> Any) {
        if minimumLevel.rawValue <= Level.middle.rawValue {
            print("[YCPhotoBrowser] [middle]", item())
        }
    }
    
    public static func high(_ item: @autoclosure () -> Any) {
        if minimumLevel.rawValue <= Level.high.rawValue {
            print("[YCPhotoBrowser] [high]", item())
        }
    }
}
