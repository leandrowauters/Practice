//
//  VenueAPIClient.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/8/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

struct VenueAPIClient {
    static func searchForVenueNearBy(location: String,completionHandler: @escaping (AppError?, [VenueDetails]?) -> Void){
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/search?ll=\(location)&client_id=H02XVB2YYM3PCYFESXBGEFFI0A15HOYTK2BHLZBCHSUHUTVH&client_secret=XQGJPPQK51FL4YZRG412AMGU03PVZHPSCJHMVE5IAOXNCZGD&v=20190208") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad URL"), nil)
            }
            if let data = data {
                do{
                    let vanueData = try JSONDecoder().decode(Venue.self, from: data)
                    dump(vanueData)
                    completionHandler(appError, vanueData.response.venues)
                }catch{
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    static func searchForVenueAnyLocation(location: String, keyword: String, completionHandler: @escaping(AppError?,[VenueDetails]?)-> Void) {
        let location = location.replacingOccurrences(of: " ", with: "")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/search?near=\(location)&client_id=H02XVB2YYM3PCYFESXBGEFFI0A15HOYTK2BHLZBCHSUHUTVH&client_secret=XQGJPPQK51FL4YZRG412AMGU03PVZHPSCJHMVE5IAOXNCZGD&v=20190208&query=\(keyword)") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad URL"), nil)
            }
            if let data = data {
                do{
                    let vanueData = try JSONDecoder().decode(Venue.self, from: data)
                    dump(vanueData)
                    completionHandler(appError, vanueData.response.venues)
                }catch{
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
