//
//  SliderContent.swift
//  CharityProject
//
//  Created by Vinayak Sareen on 09/10/2019.
//  Copyright © 2019 Vinayak Sareen. All rights reserved.
//

import UIKit

class SliderContent{
    let image: UIImage
    let content: String
    let description: String
    init(image: UIImage, content: String, description: String) {
        self.image = image
        self.content = content
        self.description = description
    }
    
    static public func slides() -> [SliderContent] {
        let slide1 = SliderContent.init(image: #imageLiteral(resourceName: "slider1"), content: "Digital Charity Application", description: "Help people directly through our mobile service")
        let slide2 = SliderContent.init(image: #imageLiteral(resourceName: "slider2"), content: "Connect with community", description: "Connect with other charity organisations.")
        let slide3 = SliderContent.init(image: #imageLiteral(resourceName: "slider3"), content: "Awesome Feeling", description: "It feels awesome to help others within community")
        let slide4 = SliderContent.init(image: #imageLiteral(resourceName: "slider4"), content: "You can also join our team", description: "Share your information and we will you to join our team")
        let slides = [slide1, slide2, slide3, slide4]
        return slides
    }
    
}
