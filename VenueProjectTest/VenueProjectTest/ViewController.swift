//
//  ViewController.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/8/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    
    var nearbyVenues = [VenueDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.exploreNearByCollectionView.reloadData()
            }
        }
    }
    var mainView = MainView()
    override func viewDidLoad() {
 
        super.viewDidLoad()
        view.addSubview(mainView)
        mainView.exploreNearByCollectionView.dataSource = self
        mainView.exploreNearByCollectionView.delegate = self
//        VenueAPIClient.searchForVenueAnyLocation(location: "Queens, NY", keyword: "tacos") { (appError, venues) in
//            if let appError = appError {
//                print(appError)
//            }
//            if let venues = venues{
//                self.nearbyVenues = venues
//            }
//
//        }
//        VenueAPIClient.searchForVenueNearBy(location: "40.7,-74") { (appError, venues) in
//            if let appError = appError {
//                print(appError)
//            }
//            if let venues = venues{
//                self.nearbyVenues = venues
//            }
//        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearByCell", for: indexPath) as? NearByCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize.init(width: collectionView.bounds.width * 0.75, height: collectionView.bounds.height * 0.75)
    }
}

