//
//  ViewController.swift
//  NoStoryboardCollectionViewSample
//
//  Created by Morita Jun on 2017/11/29.
//  Copyright © 2017年 Morita Jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コレクションビューの設定
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupCollectionView() {
        
        // 多分これがUICollectionViewDelegateFlowLayoutだと画面サイズに合わせてサイズを動的にーってのと相反する処理
        
        // NOTE：全てのCellを同じ大きさで表示する際にこの設定を行う
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // 縦か横か
        flowLayout.scrollDirection = .vertical
        // 余白設定の1つ。列間の余白の最小値を指定
        flowLayout.minimumInteritemSpacing = 5.0
        // 余白設定の1つ。行間の余白の値を設定
        flowLayout.minimumLineSpacing = 5.0
        // NOTE: これをすると動的な変更は行えないので注意
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        
        setupCollectionConstrains()
    }
    
    private func setupCollectionConstrains() {

        // NSLayoutAnchorで
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
     // CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
}

