//
//  YCPhotoProtocolCell.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import UIKit

/// 生成带browser的View
public protocol YCPhotoCell: UIView {
    static func generate(with browser: YCPhotoBrowser) -> Self
}

/// 在Zoom转场时使用
public protocol YCPhotoZoomCell: UIView {
    /// 内容视图
    var showContentView: UIView { get }
}
