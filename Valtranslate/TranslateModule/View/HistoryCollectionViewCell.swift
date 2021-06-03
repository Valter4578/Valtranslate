//
//  HistoryCollectionViewCell.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import UIKit
import SnapKit

final class HistoryCollectionViewCell: UICollectionViewCell {
    
    // MARK:- Views
    lazy var lastTranslatedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    lazy var lastTranslationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lastTranslatedLabel, lastTranslationLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .accentPurple
        setupTranslatedLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 20
    }
    
    // MARK:- Setups
    private func setupTranslatedLabel() {
        contentView.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
}
