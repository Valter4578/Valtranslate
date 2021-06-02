//
//  BottomSheetViewController.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 31.05.2021.
//

import UIKit
import SnapKit

final class BottomSheetViewController: UIViewController {
    // MARK:- Properties
    
    // MARK:- Views
    lazy var translateTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 24)
        textView.textAlignment = .center
        textView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        return textView
    }()
    
    lazy var translatedTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 24)
        textView.textAlignment = .center
        textView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        textView.isEditable = false
        return textView
    }()
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        setupTextView()
        setupTranslatedTextView()
    }
    
    // MARK:- Functions
    private func setupTextView() {
        view.addSubview(translateTextView)
        translateTextView.layer.cornerRadius = 20
        translateTextView.snp.makeConstraints { make in
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.top.equalTo(view)
            make.height.equalTo(100)
        }
    }
    
    private func setupTranslatedTextView() {
        view.addSubview(translatedTextView)
        translatedTextView.snp.makeConstraints { make in
            make.top.equalTo(translateTextView.snp.bottom)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
    }
}
