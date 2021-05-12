//
//  LocalImageSmoothZoomViewController.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import UIKit
import YCPhotoBrowser

class LocalImageSmoothZoomViewController: BaseCollectionViewController {
    
    override var name: String { "更丝滑的Zoom转场动画" }
    
    override var remark: String { "需要用户自己创建并提供转场视图，以及缩略图位置" }
    
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
        // 更丝滑的Zoom动画
        browser.transitionAnimator = YCPhotoSmoothZoomAnimator(transitionViewAndFrame: { (index, destinationView) -> YCPhotoSmoothZoomAnimator.TransitionViewAndFrame? in
            let path = IndexPath(item: index, section: indexPath.section)
            guard let cell = collectionView.cellForItem(at: path) as? BaseCollectionViewCell else {
                return nil
            }
            let image = cell.imageView.image
            let transitionView = UIImageView(image: image)
            transitionView.contentMode = cell.imageView.contentMode
            transitionView.clipsToBounds = true
            let thumbnailFrame = cell.imageView.convert(cell.imageView.bounds, to: destinationView)
            return (transitionView, thumbnailFrame)
        })
        browser.pageIndex = indexPath.item
        browser.show(method: .push(inNC: nil))
    }
}
