//
//  ViewController.swift
//  TheMermaidsTailQuest
//
//  Created by Cenker Soyak on 13.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var apps: [AppModel] = []

    // MARK: UIComponents
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
        
    }()
    
    var chosenCell: AppModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        addApps()
    }
    
    func createUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    @objc func loadData() {
        collectionView.reloadData()
        stopRefresher()
    }
    func stopRefresher() {
        collectionView.refreshControl!.endRefreshing()
    }
    func addApps(){
        let app1 = AppModel(appName: "AI Rap & Music Generator", appLogo: UIImage(named: "airap"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "11 Oct 22", category: .music)
        let app2 = AppModel(appName: "AI Video Avatars", appLogo: UIImage(named: "aiavatars"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "23 Apr 21", category: .utilities)
        let app3 = AppModel(appName: "AI Manga Filters", appLogo: UIImage(named: "aimanga"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "12 Jan 22", category: .utilities)
        let app4 = AppModel(appName: "AI Cartoon Yourself", appLogo: UIImage(named: "aicartoon"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "27 Oct 23", category: .utilities)
        let app5 = AppModel(appName: "AI Headshot Creator", appLogo: UIImage(named: "aiheadshot"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "16 Mar 22", category: .utilities)
        let app6 = AppModel(appName: "AI Rap & Music Generator", appLogo: UIImage(named: "airap"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "11 Oct 22", category: .music)
        let app7 = AppModel(appName: "AI Video Avatars", appLogo: UIImage(named: "aiavatars"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "23 Apr 21", category: .utilities)
        let app8 = AppModel(appName: "AI Manga Filters", appLogo: UIImage(named: "aimanga"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "12 Jan 22", category: .utilities)
        let app9 = AppModel(appName: "AI Cartoon Yourself", appLogo: UIImage(named: "aicartoon"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "27 Oct 23", category: .utilities)
        let app10 = AppModel(appName: "AI Headshot Creator", appLogo: UIImage(named: "aiheadshot"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "16 Mar 22", category: .utilities)
        let app11 = AppModel(appName: "AI Rap & Music Generator", appLogo: UIImage(named: "airap"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "11 Oct 22", category: .music)
        let app12 = AppModel(appName: "AI Video Avatars", appLogo: UIImage(named: "aiavatars"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "23 Apr 21", category: .utilities)
        let app13 = AppModel(appName: "AI Manga Filters", appLogo: UIImage(named: "aimanga"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "12 Jan 22", category: .utilities)
        let app14 = AppModel(appName: "AI Cartoon Yourself", appLogo: UIImage(named: "aicartoon"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "27 Oct 23", category: .utilities)
        let app15 = AppModel(appName: "AI Headshot Creator", appLogo: UIImage(named: "aiheadshot"), appURL: "https://apps.apple.com/tr/app/ai-voice-music-generator/id6447696368?l=tr", releaseDate: "16 Mar 22", category: .utilities)
        
        apps = [app1, app2, app3, app4, app5, app6, app7, app8, app9, app10, app11, app12, app13, app14, app15]
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        let image = apps[indexPath.row].appLogo
        let text = apps[indexPath.row].appName
        cell.configure(with: image, and: text)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width * 0.48, height: view.frame.size.height / 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = apps[indexPath.row]
        let detailVC = ChoosenCellViewController()
        detailVC.selectedApp = selectedCell
        present(detailVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let app = apps[indexPath.item]
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { _ in
                let activityVC = UIActivityViewController(activityItems: [URL(string: app.appURL)!], applicationActivities: nil)
                self.present(activityVC, animated: true)
            }
            return UIMenu(title: "", children: [shareAction])
        }
    }
}

#Preview(){
    ViewController()
}
