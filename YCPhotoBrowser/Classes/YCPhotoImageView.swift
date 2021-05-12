//
//  YCPhotoImageView.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import UIKit

/// 自定义监听图片改变的ImageView
public class YCPhotoImageView: UIImageView {
    
    public var imageDidChangedHandler: (() -> Void)?
    
    public override var image: UIImage? {
        didSet {
            imageDidChangedHandler?()
        }
    }
    
}
