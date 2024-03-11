//
//  FlightCellTableViewCell.swift
//  AzApi
//
//  Created by Sefa Aycicek on 27.02.2024.
//

import UIKit
import Kingfisher

class FlightCellTableViewCell: UITableViewCell, FlightCellProtocol {
    
    
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var flightContainerView: UIView!
    
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var lblDeparture: UILabel!
    @IBOutlet weak var lblLanding: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblBaggage: UILabel!
    @IBOutlet weak var lblRoute: UILabel!
    
    var viewModel : FlightSearchTableCellUIData!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(flightData: FlightSearchTableCellUIData) {
        flightContainerView.layer.cornerRadius = 16
        flightContainerView.layer.borderColor = UIColor.lightGray.cgColor
        flightContainerView.layer.borderWidth = 1
        
        companyNameLabel.text = flightData.companyDisplayName
        lblDeparture.text = flightData.departureDate
        lblLanding.text = flightData.landingDate
        lblPrice.text = "\(flightData.price)"
        lblRoute.text = "\(flightData.origin)>\(flightData.departure)"
        
        //self.companyImageView.loadImage(urlString: item.companyImageUrl)
        self.companyImageView.kf.setImage(with: URL(string: flightData.companyImageUrl)) { image in
            print("resim yüklendik sonra")
            //image.get().image.size
            
            //width : 3 height 2 = 3/2 = 1.5
            
            // w ?  : h : 35
            
            if let size = try? image.get().image.size {
                let ratio = size.width / size.height
                self.imageWidthConstraint.constant = self.imageHeightConstraint.constant * ratio
            }
        }

    }
}

protocol FlightCellProtocol {
    func configure(flightData : FlightSearchTableCellUIData)
}

protocol CellViewModelProtocol {
    
}

extension UIImageView {
    func loadImage(urlString : String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: url) {
                    let image = UIImage(data: imageData)
                    
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    
                }
            }
        }
    }
}
