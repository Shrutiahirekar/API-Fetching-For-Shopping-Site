//
//  ProductData.swift
//  IndividualAPIFetching
//
//  Created by Mac on 24/11/22.
//

import UIKit

class ProductData: UITableViewCell {
    
    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
