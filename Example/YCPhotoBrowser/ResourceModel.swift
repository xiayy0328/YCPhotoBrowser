//
//  ResourceModel.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//
import Foundation

/// 视像资源模型
class ResourceModel {
    /// 第一级资源
    var firstLevelUrl: String?
    /// 第二级资源
    var secondLevelUrl: String?
    /// 第三级资源
    var thirdLevelUrl: String?
    /// 本地资源，资源名
    var localName: String?
    /// 备注配文
    var remark: String?
}
