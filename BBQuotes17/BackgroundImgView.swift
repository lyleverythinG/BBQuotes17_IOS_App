//
//  BackgroundImageView.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 12/2/24.
//
import SwiftUI

struct BackgroundImgView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
    }
}
