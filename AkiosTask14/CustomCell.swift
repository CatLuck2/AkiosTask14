//
//  CustomCell.swift
//  AkiosTask14
//
//  Created by Nekokichi on 2020/08/21.
//  Copyright © 2020 Nekokichi. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet private(set) weak var checkItemImage: UIImageView!
    @IBOutlet private(set) weak var checkItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(text:String, keyCheck:Bool) {
        let Resize:CGSize = CGSize.init(width: checkItemImage.frame.width, height:checkItemImage.frame.height)
        //チェックマークの画像を表示
        if keyCheck {
            let imageResize = UIImage(systemName: "checkmark")!.resize(size: Resize)
            checkItemImage.image = imageResize
        } else {
            let myImage = UIImage.colorImage(color: UIColor.white, size: checkItemImage.frame.size, imageView: checkItemImage)
            let imageResize = myImage.resize(size: Resize)
            checkItemImage.image = imageResize
        }
        //チェックリストのテキストを表示
        checkItemLabel.text = text
    }
    
}

extension UIImage {
    
    func resize(size _size: CGSize) -> UIImage? {
        let widthRatio = _size.width / size.width
        let heightRatio = _size.height / size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
        
        let resizedSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0) // 変更
        draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    class func colorImage(color: UIColor, size: CGSize, imageView:UIImageView) -> UIImage {
        UIGraphicsBeginImageContext(size)

        let rect = imageView.frame
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsEndImageContext()

        return image
   }
    
}
