//
//  ResultsView.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit
import MapKit

class ResultsView: UIView {

    lazy var pullViewButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "icons8-chevron_up"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    
    lazy var resultVenueMap: MKMapView = {
       var map = MKMapView()
        map.mapType = .standard
        return map
    }()
    
    lazy var venueSearchBar: UISearchBar = {
       var searchBar = UISearchBar()
        return searchBar
    }()
    lazy var venuesTableView: UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    lazy var myFavCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        venuesTableView.register(VenueTableViewCell.self, forCellReuseIdentifier: "VenueCell")
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func commonInit(){
        setupSearchBar()
        setupMap()
        setupCollectionView()
        setupTableView()
        setupButton()
        
        
    }

    func setupButton(){
        addSubview(pullViewButton)
        pullViewButton.translatesAutoresizingMaskIntoConstraints = false
        pullViewButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pullViewButton.bottomAnchor.constraint(equalTo: venuesTableView.topAnchor).isActive = true
        pullViewButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pullViewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setupMap(){
        addSubview(resultVenueMap)
        resultVenueMap.translatesAutoresizingMaskIntoConstraints = false
        resultVenueMap.topAnchor.constraint(equalTo: venueSearchBar.bottomAnchor).isActive = true
        resultVenueMap.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        resultVenueMap.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        resultVenueMap.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        
    }
    func setupSearchBar(){
        addSubview(venueSearchBar)
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        venueSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        venueSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        venueSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    func setupTableView(){
        addSubview(venuesTableView)
        venuesTableView.translatesAutoresizingMaskIntoConstraints = false
        venuesTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        venuesTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        venuesTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        venuesTableView.heightAnchor.constraint(equalToConstant: 0).isActive = true
    }
    
    func setupCollectionView(){
        addSubview(myFavCollectionView)
        myFavCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myFavCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myFavCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myFavCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myFavCollectionView.heightAnchor.constraint(equalToConstant: 0).isActive = true
    }
}
