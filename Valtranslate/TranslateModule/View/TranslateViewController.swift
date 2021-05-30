//
//  TranslateViewController.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import UIKit
import RxCocoa
import RxSwift

class TranslateViewController: UIViewController {
    
    // MARK:- Private properties
    private let collectionViewCellId = "TranslateViewController"
    private let disposeBag = DisposeBag()
    
    // MARK:- Dependencies
    weak var coordinator: AppCoordinator?
    
    // MARK:- Views
    lazy var historyCollectionView: UICollectionView = {
        let layout = setupHistoryCollectionViewLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellId)
        return collectionView
    }()
    
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainPurple
        
        setupCollectionView()
        
        let items = Observable.just(
            (0..<4).map{ "Test \($0)" }
        )

         items
             .bind(to: historyCollectionView.rx.items(cellIdentifier: collectionViewCellId, cellType: HistoryCollectionViewCell.self)) { (row, element, cell) in
                
                cell.lastTranslatedLabel.text = element
                cell.lastTranslationLabel.text = element
             }
             .disposed(by: disposeBag)
    }
    
    // MARK:- Setups
    private func setupHistoryCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.95))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)

        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func setupCollectionView() {
        historyCollectionView.backgroundColor = .mainPurple
        view.addSubview(historyCollectionView)
        historyCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(170)
        }
    }
}
