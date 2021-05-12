//
//  LocalImageViewController.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import UIKit
import YCPhotoBrowser

class LocalImageViewController: BaseCollectionViewController {
    
    override var name: String { "本地图片" }
    
    override var remark: String { "最简单的场景，展示本地图片" }
    
    override func makeDataSource() -> [ResourceModel] {
        makeLocalDataSource()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.fc.dequeueReusableCell(BaseCollectionViewCell.self, for: indexPath)
        cell.imageView.image = self.dataSource[indexPath.item].localName.flatMap { UIImage(named: $0) }
        return cell
    }
    
    override func openPhotoBrowser(with collectionView: UICollectionView, indexPath: IndexPath) {
        // 实例化
        let browser = YCPhotoBrowser()
        // 浏览过程中实时获取数据总量
        browser.numberOfItems = {
            self.dataSource.count
        }
        // 刷新Cell数据。本闭包将在Cell完成位置布局后调用。
        browser.reloadCellAtIndex = { context in
            let photoCell = context.cell as? YCPhotoImageCell
            let indexPath = IndexPath(item: context.index, section: indexPath.section)
            photoCell?.imageView.image = self.dataSource[indexPath.item].localName.flatMap { UIImage(named: $0) }
        }
        // 可指定打开时定位到哪一页
        browser.pageIndex = indexPath.item
        // 展示
        browser.show()
    }
}
