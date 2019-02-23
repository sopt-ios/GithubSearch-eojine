//
//  UIImageView+imageFromUrl.swift
//  GithubSearch
//
//  Created by 양어진 on 24/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    //이미지뷰 동그랗게 설정
    func circleImageView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
    }
}

extension UIImageView {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
}
