//
//  UITableViewExtension.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import UIKit

extension UITableView: NamespaceWrappable {}

extension TypeWrapperProtocol where WrappedType == UITableView {
    /// 注册Cell
    public func registerCell<T: UITableViewCell>(_ type: T.Type) {
        let identifier = String(describing: type.self)
        wrappedValue.register(type, forCellReuseIdentifier: identifier)
    }

    /// 取重用Cell
    public func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type) -> T {
        let identifier = String(describing: type.self)
        guard let cell = wrappedValue.dequeueReusableCell(withIdentifier: identifier) as? T else {
            fatalError("\(type.self) was not registered")
        }
        return cell
    }
}
