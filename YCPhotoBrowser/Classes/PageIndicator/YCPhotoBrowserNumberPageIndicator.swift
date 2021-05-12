//
//  YCPhotoBrowserNumberPageIndicator.swift
//  YCPhotoBrowserDemo
//
//  Created by Xyy on 2021/5/11.
//

import UIKit

open class YCPhotoBrowserNumberPageIndicator: UILabel, YCPhotoBrowserPageIndicator {
    
    ///  页码与顶部的距离
    open lazy var topPadding: CGFloat = {
        if #available(iOS 11.0, *),
            let window = UIApplication.shared.keyWindow {
            return window.safeAreaInsets.top
        }
        return 20
    }()
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
    }
    
    private func config() {
        font = UIFont.systemFont(ofSize: 17)
        textAlignment = .center
        textColor = UIColor.white
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        layer.masksToBounds = true
    }
    
    public func setup(with browser: YCPhotoBrowser) { }
    
    private var total: Int = 0
    
    public func reloadData(numberOfItems: Int, pageIndex: Int) {
        total = numberOfItems
        text = "\(pageIndex + 1) / \(total)"
        sizeToFit()
        frame.size.width += frame.height
        layer.cornerRadius = frame.height / 2
        if let view = superview {
            center.x = view.bounds.width / 2
            frame.origin.y = topPadding
        }
        isHidden = numberOfItems <= 1
    }
    
    public func didChanged(pageIndex: Int) {
        text = "\(pageIndex + 1) / \(total)"
    }
    
}

