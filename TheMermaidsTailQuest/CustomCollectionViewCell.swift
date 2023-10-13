//
//  CustomCollectionViewCell.swift
//  TheMermaidsTailQuest
//
//  Created by Cenker Soyak on 13.10.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        return imageView
    }()
    let appLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    func configure(with image: UIImage?, and text: String) {
        self.myImageView.image = image
        self.appLabel.text = text
        setupUI()
    }
    func setupUI(){
        self.addSubview(myImageView)
        self.addSubview(appLabel)
        self.backgroundColor = .white
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 10
        self.addSubview(myImageView)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).inset(20)
            make.height.equalTo(100)
        }
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        appLabel.snp.makeConstraints { make in
            make.top.equalTo(myImageView.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(self.frame.size.width)
        }
    }
}
