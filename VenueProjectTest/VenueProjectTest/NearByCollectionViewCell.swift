//
//  NearByCollectionViewCell.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class NearByCollectionViewCell: UICollectionViewCell {
    
    lazy var venueImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "placeholder")
        image.contentMode = .scaleAspectFit
        return image
    }()
    lazy var venueNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Venue's Name"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var venueAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Venue's Address"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupImage()
        setupVenueName()
        setupVenueAddress()
    }
    
    func setupImage(){
        addSubview(venueImage)
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        venueImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        venueImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        venueImage.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    }
    
    func setupVenueName(){
        addSubview(venueNameLabel)
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        venueNameLabel.topAnchor.constraint(equalTo: venueImage.bottomAnchor, constant: 30).isActive = true
        venueNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        venueNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func setupVenueAddress(){
        addSubview(venueAddressLabel)
        venueAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        venueAddressLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant: 7).isActive = true
        venueAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        venueAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
