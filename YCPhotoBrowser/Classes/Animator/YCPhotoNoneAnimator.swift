//
//  YCPhotoNoneAnimator.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import UIKit

/// 使用本类以实现不出现转场动画的需求
open class YCPhotoNoneAnimator: YCPhotoFadeAnimator {
    
    public override init() {
        super.init()
        showDuration = 0
        dismissDuration = 0
    }
}
