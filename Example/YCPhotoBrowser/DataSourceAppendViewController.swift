//
//  DataSourceAppendViewController.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import UIKit
import YCPhotoBrowser

class DataSourceAppendViewController: BaseCollectionViewController {

    override var name: String { "无限新增图片" }
    
    override var remark: String { "浏览过程中不断新增图片，变更数据源，刷新UI" }
    
    override func makeDataSource() -> [ResourceModel] {
        makeLocalDataSource()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.fc.dequeueReusableCell(BaseCollectionViewCell.self, for: indexPath)
        cell.imageView.image = self.dataSource[indexPath.item].localName.flatMap { UIImage(named: $0) }
        return cell
    }
    
    override func openPhotoBrowser(with collectionView: UICollectionView, indexPath: IndexPath) {
        let browser = YCPhotoBrowser()
        browser.numberOfItems = {
            self.dataSource.count
        }
        browser.reloadCellAtIndex = { context in
            let photoCell = context.cell as? YCPhotoImageCell
            let indexPath = IndexPath(item: context.index, section: indexPath.section)
            photoCell?.imageView.image = self.dataSource[indexPath.item].localName.flatMap { UIImage(named: $0) }
        }
        browser.transitionAnimator = YCPhotoZoomAnimator(previousView: { index -> UIView? in
            let path = IndexPath(item: index, section: indexPath.section)
            let cell = collectionView.cellForItem(at: path) as? BaseCollectionViewCell
            return cell?.imageView
        })
        // 监听页码变化
        browser.didChangedPageIndex = { index in
            // 已到最后一张
            if index == self.dataSource.count - 1 {
                browser.lastNumberOfItems = index
                self.appendMoreData(browser: browser)
            }
        }
        browser.scrollDirection = .horizontal
        browser.pageIndex = indexPath.item
        browser.show()
    }
    
    private func appendMoreData(browser: YCPhotoBrowser) {
        var randomIndexes = (0..<6).map { $0 }
        randomIndexes.shuffle()
        randomIndexes.forEach { index in
            let model = ResourceModel()
            model.localName = "local_\(index)"
            dataSource.append(model)
        }
        collectionView?.reloadData()
        browser.reloadData()
    }
}

