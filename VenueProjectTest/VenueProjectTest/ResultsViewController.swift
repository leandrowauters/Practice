//
//  ResultsViewController.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//
enum ScreenState {
    case on
    case off
}
import UIKit


class ResultsViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell", for: indexPath) as? VenueTableViewCell else {return UITableViewCell()}
        return cell
        
    }
    
    var sceenState: ScreenState = .off
    let resutlView = ResultsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resutlView)
        resutlView.venuesTableView.dataSource = self
        resutlView.pullViewButton.addTarget(self, action: #selector(pullViewButtonPressed), for: .touchUpInside)
        resutlView.venuesTableView.dataSource = self
    }
    
    @objc func pullViewButtonPressed() {
        if sceenState == .off {
        sceenState = .on
        resutlView.pullViewButton.setImage(UIImage(named: "icons8-chevron_down"), for: .normal)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            print(self.resutlView.venuesTableView.frame )
            self.resutlView.venuesTableView.frame = CGRect(x: self.resutlView.venuesTableView.frame.origin.x, y: self.resutlView.venuesTableView.frame.origin.y, width: self.resutlView.venuesTableView.frame.width, height: -self.resutlView.frame.height * 0.65)
            self.resutlView.myFavCollectionView.frame = CGRect(x: self.resutlView.myFavCollectionView.frame.origin.x, y: self.resutlView.myFavCollectionView.frame.origin.y, width: self.resutlView.myFavCollectionView.frame.width, height: self.resutlView.frame.height * 0.35)

        })
        } else {
            sceenState = .off
            resutlView.pullViewButton.setImage(UIImage(named: "icons8-chevron_up"), for: .normal)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.resutlView.venuesTableView.frame = CGRect(x: 0.0, y: self.resutlView.frame.origin.y + self.resutlView.frame.size.height, width: self.resutlView.venuesTableView.frame.width, height: 0)
                self.resutlView.myFavCollectionView.frame = CGRect(x: 0.0, y: self.resutlView.frame.origin.y, width: self.resutlView.myFavCollectionView.frame.width, height: 0)
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
