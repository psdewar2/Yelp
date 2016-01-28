//
//  BusinessCell.swift
//  Yelp
//
//  Created by Peyt Spencer Dewar on 1/19/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet var thumbnailView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var ratingsView: UIImageView!
    @IBOutlet var reviewCountLabel: UILabel!
    
    //yelp api doesn't give any info about pricing
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var categoriesLabel: UILabel!
    
    var business: Business! {
        //here the view configures themselves so here is an observer
        didSet {
            thumbnailView.setImageWithURL(business.imageURL!)
            nameLabel.text = business.name
            distanceLabel.text = business.distance
            ratingsView.setImageWithURL(business.ratingImageURL!)
            reviewCountLabel.text = "\(business.reviewCount!) Reviews"
            addressLabel.text = business.address
            categoriesLabel.text = business.categories
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbnailView.layer.cornerRadius = 3
        thumbnailView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
