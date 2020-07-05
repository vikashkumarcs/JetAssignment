//
//  DataMaping.swift
//  WetherForcastApp
//
//  Created by Vikash on 30/06/20.
//  Copyright © 2020 Vikash. All rights reserved.
//

import Foundation

class DataMaping {
    
    func mappingData(item: Any, cellInfo: inout CellModel) {
        
        let json = item as? [String:Any]
        
        if let data = json?["comments"],
            let comments = data as? Int {
            cellInfo.comments = comments
            print(comments)
        }
        
        if let data = json?["likes"],
            let likes = data as? Int {
            cellInfo.likes = likes
            print(likes)
        }
        
        if let data = json?["content"],
            let content = data as? String {
            cellInfo.articleDescription = content
            print(content)
        }
        
        if let media = json?["media"] as? [Any],
            let content = media[0] as? [String:Any] {
            
            if let imageUrl = content["image"] as? String {
                cellInfo.imageurl = imageUrl
                print(imageUrl)
            }
            
            if let title = content["title"] as? String {
                cellInfo.articleTitle = title
                print(title)
            }
            
            if let articleUrl = content["url"] as? String {
                cellInfo.articleUrl = articleUrl
                print(articleUrl)
            }
        }
        
        if let user = json?["user"] as? [Any],
            let content = user[0] as? [String:Any] {
            
            if let name = content["name"] as? String {
                cellInfo.userName = name
                print(name)
            }
            
            if let avatar = content["avatar"] as? String {
                cellInfo.avatarurl = avatar
                print(avatar)
            }
            
            if let designation = content["designation"] as? String {
                cellInfo.userDesignation = designation
                print(designation)
            }
        }
    }
}
