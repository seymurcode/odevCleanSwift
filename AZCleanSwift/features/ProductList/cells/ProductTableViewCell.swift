//
//  ProductTableViewCell.swift
//  AZCleanSwift
//
//  Created by Seymur Askarov on 10.03.24.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell, ProductCellProtocol {
    
    

    @IBOutlet weak var thumbail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var priceMain: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var priceOld: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    var viewModel : ProductTableCellUIData!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(productData: ProductTableCellUIData) {
        cellView.layer.cornerRadius = 12
     
        
        title.text = productData.title
        desc.text = productData.description
        priceMain.text = "\(productData.price) TL"
        priceOld.attributedText = ("\(productData.priceOld) TL").strikeThrough()
        
        //self.companyImageView.loadImage(urlString: item.companyImageUrl)
        self.thumbail.kf.setImage(with: URL(string: productData.thumbnail)) { image in
            print("resim yüklendik sonra")
            //image.get().image.size
            
            //width : 3 height 2 = 3/2 = 1.5
            
            // w ?  : h : 35
            
            /*if let size = try? image.get().image.size {
                let ratio = size.width / size.height
                self.imageWidthConstraint.constant = self.imageHeightConstraint.constant * ratio
            }*/
        }
    }
}


protocol ProductCellProtocol {
    func configure(productData : ProductTableCellUIData)
}


extension String {

  /// Apply strike font on text
  func strikeThrough() -> NSAttributedString {
    let attributeString = NSMutableAttributedString(string: self)
    attributeString.addAttribute(
      NSAttributedString.Key.strikethroughStyle,
      value: 1,
      range: NSRange(location: 0, length: attributeString.length))

      return attributeString
     }
}

