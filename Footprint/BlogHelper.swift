//
//  BlogHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

struct Blog {
    let imageUrl:String?
    let title:String!
    let blogDescription:String!
    let comments:[String]?
    let time:String!
    let category:String!
}

final class BlogHelper
{
    static let dataSource = [
       Blog(imageUrl: "blog1", title: "FootPrint Blog", blogDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", comments: ["Hi", "Hi"], time: Date().string(), category: "Fashion, New Trends"),
            
        Blog(imageUrl: "blog2", title: "FootPrint Blog", blogDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", comments: ["Hi", "Hi"], time: Date().string(), category: "Fashion, New Trends")
    ]
}
