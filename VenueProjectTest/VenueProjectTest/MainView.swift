//
//  MainView.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class MainView: UIView {
    lazy var venueSearchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "E.g Sushi, Tacos, Halal"
        return searchBar
    }()
    lazy var button0: UIButton = {
        var button = UIButton()
        button.setTitle("button 0", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    lazy var button1: UIButton = {
        var button = UIButton()
        button.setTitle("Button1", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    lazy var button2: UIButton = {
        var button = UIButton()
        button.setTitle("Button2", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    lazy var button3: UIButton = {
        var button = UIButton()
        button.setTitle("Button3", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    lazy var button4: UIButton = {
        var button = UIButton()
        button.setTitle("Button4", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    lazy var button5: UIButton = {
        var button = UIButton()
        button.setTitle("Button5", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    lazy var exploreNearByLabel: UILabel = {
       var label = UILabel()
        label.text = "Explore Near By"
        label.font = UIFont(name: "Arial", size: 22)
        label.textAlignment = .center
        return label
    }()
    lazy var exploreNearByCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return collectionView
    }()
    lazy var venueSearchTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .red
        return textField
    }()
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [venueSearchTextField, searchButton])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    override init(frame: CGRect) {
       super.init(frame: UIScreen.main.bounds)
        commonInit()
        backgroundColor = .white
        exploreNearByCollectionView.register(NearByCollectionViewCell.self, forCellWithReuseIdentifier: "NearByCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit(){
        setupViews()
    }
    func setupViews(){
        setupSearchBar()
//        setupStackView()
        setupButtons(buttons: [button0, button1, button2, button3, button4, button5])
        setupLabel()
        setupCollectionView()
        
    }
    func setupButtons(buttons: [UIButton]){
        for button in buttons{
            addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 80).isActive = true
            button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        }
        button1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: venueSearchBar.bottomAnchor, constant: 50).isActive = true
        button0.centerXAnchor.constraint(equalTo: button1.centerXAnchor, constant: -100).isActive = true
        button0.centerYAnchor.constraint(equalTo: button1.centerYAnchor).isActive = true
        button2.centerXAnchor.constraint(equalTo: button1.centerXAnchor, constant: 100).isActive = true
        button2.centerYAnchor.constraint(equalTo: button1.centerYAnchor).isActive = true
        button4.centerYAnchor.constraint(equalTo: button1.centerYAnchor, constant: 100).isActive = true
        button4.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button3.centerXAnchor.constraint(equalTo: button4.centerXAnchor, constant: -100).isActive = true
        button3.centerYAnchor.constraint(equalTo: button4.centerYAnchor).isActive = true
        button5.centerXAnchor.constraint(equalTo: button4.centerXAnchor, constant: 100).isActive = true
        button5.centerYAnchor.constraint(equalTo: button4.centerYAnchor).isActive = true

    }
    
    func setupStackView() {
        addSubview(stackView)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        venueSearchTextField.translatesAutoresizingMaskIntoConstraints = false
        venueSearchTextField.heightAnchor.constraint(equalTo: searchButton.heightAnchor).isActive = true
        venueSearchTextField.widthAnchor.constraint(equalToConstant: 90).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    func setupSearchBar(){
        addSubview(venueSearchBar)
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        venueSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        venueSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        venueSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    func setupLabel(){
        addSubview(exploreNearByLabel)
        exploreNearByLabel.translatesAutoresizingMaskIntoConstraints = false
        exploreNearByLabel.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 75).isActive = true
        exploreNearByLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive  = true
        exploreNearByLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
    }
    func setupCollectionView(){
        addSubview(exploreNearByCollectionView)
        exploreNearByCollectionView.translatesAutoresizingMaskIntoConstraints = false
        exploreNearByCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        exploreNearByCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        exploreNearByCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        exploreNearByCollectionView.topAnchor.constraint(equalTo: exploreNearByLabel.bottomAnchor, constant: 20).isActive = true
    }
}
