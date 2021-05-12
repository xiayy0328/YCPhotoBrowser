//
//  UICollectionViewExtension.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import UIKit

extension UICollectionView: NamespaceWrappable {}

extension TypeWrapperProtocol where WrappedType == UICollectionView {
    
    /// 注册Cell
    public func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        let identifier = String(describing: type.self)
        wrappedValue.register(type, forCellWithReuseIdentifier: identifier)
    }
    
    /// 取重用Cell
    public func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: type.self)
        guard let cell = wrappedValue.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("\(type.self) was not registered")
        }
        return cell
    }
}
