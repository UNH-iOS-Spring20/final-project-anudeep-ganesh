//
//  CircleImage.swift
//  Event Advertising
//
//  Created by Anudeep Reddy Ramireddy on 4/28/20.
//  Copyright © 2020 Anudeep Reddy Ramireddy. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image:Image
    var body: some View {
        image
        .resizable()
            .frame(width:150, height:150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth:4))
            .shadow(radius:10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image:Image("event1"))
    }
}
