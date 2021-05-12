//
//  YCPhotoBrowserDefaultPageIndicator.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import UIKit

open class YCPhotoBrowserDefaultPageIndicator: UIPageControl, YCPhotoBrowserPageIndicator {
    
    /// 页码与底部的距离
    open lazy var bottomPadding: CGFloat = {
        if #available(iOS 11.0, *),
            let window = UIApplication.shared.keyWindow,
            window.safeAreaInsets.bottom > 0 {
            return 20
        }
        return 15
    }()
    
    open func setup(with browser: YCPhotoBrowser) {
        isEnabled = false
    }
    
    open func reloadData(numberOfItems: Int, pageIndex: Int) {
        numberOfPages = numberOfItems
        currentPage = min(pageIndex, numberOfPages - 1)
        sizeToFit()
        isHidden = numberOfPages <= 1
        if let view = superview {
            center.x = view.bounds.width / 2
            frame.origin.y = view.bounds.maxY - bottomPadding - bounds.height
        }
    }
    
    open func didChanged(pageIndex: Int) {
        currentPage = pageIndex
    }
}
