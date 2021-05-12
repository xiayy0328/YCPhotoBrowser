//
//  HomeViewController.swift
//  YCPhotoBrowser
//
//  Created by Loveying on 05/11/2021.
//  Copyright (c) 2021 Loveying. All rights reserved.
//

import UIKit
import YCPhotoBrowser

class HomeViewController: UITableViewController {
    
    var dataSource: [BaseCollectionViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.fc.registerCell(HomeTableViewCell.self)
        
        // 授权网络数据访问
        guard let url = URL(string: "http://www.baidu.com") else  {
            return
        }
        YCPhotoBrowserLog.low("Request: \(url.absoluteString)")
        URLSession.shared.dataTask(with: url) { (data, resp, _) in
            if let response = resp as? HTTPURLResponse {
                YCPhotoBrowserLog.low("Response statusCode: \(response.statusCode)")
            }
        }.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = [
            LocalImageViewController(),
            LocalImageZoomViewController(),
            LocalImageSmoothZoomViewController(),
            CustomViewController(),
            KingfisherImageViewController(),
            SDWebImageViewController(),
            GIFViewController(),
            DataSourceDeleteViewController(),
            DataSourceAppendViewController(),
            PushNextViewController(),
            LoadingProgressViewController(),
            MultipleCellViewController(),
            MultipleSectionViewController(),
            DefaultPageIndicatorViewController(),
            NumberPageIndicatorViewController(),
            VerticalBrowseViewController(),
            VideoPhotoViewController()
        ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.fc.dequeueReusableCell(HomeTableViewCell.self)
        let vc = dataSource[indexPath.row]
        cell.textLabel?.text = vc.name
        cell.detailTextLabel?.text = vc.remark
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(dataSource[indexPath.row], animated: true)
    }
}

class HomeTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
