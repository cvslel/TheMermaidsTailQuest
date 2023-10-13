//
//  AppModel.swift
//  TheMermaidsTailQuest
//
//  Created by Cenker Soyak on 13.10.2023.
//

import Foundation
import UIKit

enum appCategory: String {
    
    case music = "Music"
    case utilities = "Utilities"
    case productivity = "Productivity"
    case graphicDesign = "Graphic & Design"
}

struct AppModel {
    var appName: String
    var appLogo: UIImage?
    var appURL: String
    var releaseDate: String
    var category: appCategory
}
