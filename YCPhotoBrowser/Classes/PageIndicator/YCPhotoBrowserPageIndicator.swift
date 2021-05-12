//
//  YCPhotoBrowserPageIndicator.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import UIKit

public protocol YCPhotoBrowserPageIndicator: UIView {
    
    func setup(with browser: YCPhotoBrowser)
    
    func reloadData(numberOfItems: Int, pageIndex: Int)
    
    func didChanged(pageIndex: Int)
}
