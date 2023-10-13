//
//  ChoosenCellViewController.swift
//  TheMermaidsTailQuest
//
//  Created by Cenker Soyak on 13.10.2023.
//

import UIKit

class ChoosenCellViewController: UIViewController {
    
    var selectedApp: AppModel?
    
    let appLogo = UIImageView()
    let appNameLabel = UILabel()
    let appCategoryLabel = UILabel()
    let releaseDateLabel = UILabel()
    let redirectButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        if let name = selectedApp?.appName, let category = selectedApp?.category, let release = selectedApp?.releaseDate, let logo = selectedApp?.appLogo {
            navigationItem.title = name
            appLogo.image = logo
            appNameLabel.text = name
            appCategoryLabel.text = category.rawValue
            releaseDateLabel.text = release
        }
    }
    @objc func redirect() {
        if let urlString = selectedApp?.appURL, let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    func createUI() {
        view.backgroundColor = .white
        
        appLogo.image = UIImage(systemName: "questionmark")
        appLogo.contentMode = .scaleAspectFit
        appLogo.layer.borderWidth = 1
        appLogo.layer.cornerRadius = 10
        appLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appLogo)
        appLogo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.frame.size.width * 0.5)
            make.height.equalTo(view.frame.size.height * 0.2)
        }
        appNameLabel.text = "App Name"
        appNameLabel.textAlignment = .center
        appNameLabel.numberOfLines = 0
        appNameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(appNameLabel)
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appLogo.snp.bottom).offset(50)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(view.frame.size.width * 0.7)
            make.height.equalTo(view.frame.size.height / 15)
        }
        appCategoryLabel.text = "App Category"
        appCategoryLabel.textAlignment = .center
        appCategoryLabel.numberOfLines = 0
        appCategoryLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(appCategoryLabel)
        appCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(view.frame.size.width * 0.7)
            make.height.equalTo(view.frame.size.height / 15)
        }
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.numberOfLines = 0
        releaseDateLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(releaseDateLabel)
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(appCategoryLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(view.frame.size.width * 0.7)
            make.height.equalTo(view.frame.size.height / 15)
        }
        redirectButton.setTitle("Show on AppStore", for: .normal)
        redirectButton.configuration = .plain()
        redirectButton.layer.borderColor = UIColor.blue.cgColor
        redirectButton.layer.borderWidth = 0.5
        redirectButton.layer.cornerRadius = 7.5
        redirectButton.addTarget(self, action: #selector(redirect), for: .touchUpInside)
        view.addSubview(redirectButton)
        redirectButton.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(view.frame.size.height / 15)
        }
    }
}
