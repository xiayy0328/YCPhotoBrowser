//
//  MoreDetailViewController.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import UIKit

class MoreDetailViewController: UIViewController {
    
    lazy var label: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        lab.text = "< 更多详情 >"
        lab.textAlignment = .center
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(label)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        label.frame = view.bounds
    }
}
