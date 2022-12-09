//
//  Product.swift
//  IndividualAPIFetching
//
//  Created by Mac on 23/11/22.
//

import Foundation
struct Product{
    var id:Int
    var title:String
    var price:Double
    var description:String
    var category:String
    var image:String
    var rating:Rating
}
struct Rating{
    var rate:Double
    var count:Int
}
