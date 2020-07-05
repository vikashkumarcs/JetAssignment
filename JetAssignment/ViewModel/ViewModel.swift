//
//  ViewModel.swift
//  JetAssignment
//
//  Created by Vikash on 04/07/20.
//  Copyright © 2020 Vikash. All rights reserved.
//

import Foundation

class ViewModel {
    
    private var dataMaping:DataMaping
    private let restService: APIService
    
    var showAlertClosure: (()->())?
    var reloadTableViewClosure: (()->())?
    
    public private(set) var dataSource: [CellModel] = [CellModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    public private(set) var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    init(services:APIService, dataMaping: DataMaping) {
        self.restService = services
        self.dataMaping = dataMaping
        
        fetchDataFromAPI()
    }
    
    // call to API
    func fetchDataFromAPI() {
        let urlString = "\(APIConstant.BASE_URL)"
        self.restService.GetData(urlString: urlString, complitionHandler: { response in
            guard let json = response as?  [Any] else {
                return
            }
            var collection = [CellModel]()
            
            for item in json {
                var cellInfo = CellModel()
                self.dataMaping.mappingData(item: item, cellInfo: &cellInfo)
                collection.append(cellInfo)
            }
            self.dataSource.append(contentsOf: collection)
        })
    }
}

