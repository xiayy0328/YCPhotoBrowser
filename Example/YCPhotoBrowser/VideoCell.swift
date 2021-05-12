//
//  VideoCell.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import YCPhotoBrowser

class VideoCell: UIView, YCPhotoCell {
    
    weak var browser: YCPhotoBrowser?
    
    lazy var player = AVPlayer()
    lazy var playerLayer = AVPlayerLayer(player: player)
    
    static func generate(with browser: YCPhotoBrowser) -> Self {
        let instance = Self.init(frame: .zero)
        instance.browser = browser
        return instance
    }
    
    required override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(click))
        addGestureRecognizer(tap)
        
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    @objc private func click() {
        browser?.dismiss()
    }
}
