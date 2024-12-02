//
//  BBQuotes17App.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/25/24.
//

import SwiftUI

@main
struct BBQuotes17App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/**
 Version 2 Feature List:
 ✅ Add El Camino tab
 ✅ Utilize all character images on CharacterView
 ✅ On CharacterView, auto-scroll to bottom after status is shown
 ✅Fetch episode data
 ✅ Extend string to get rid of long image and color names
 ✅ Create static constants for show names
 */

/**
 Code Improvements/Cleanup List:
 ✅ Added reusable views.
 ✅ Added `BBText` for reusability of text.
 ✅ Created `BackgroundImgView` for reusability of Image().resizable().
 ✅Added comments.
 ✅ Added helper method in content view.
 ✅ Updated `Constants` enum structure.
 ✅Created a sub view in `FetchView` for the two buttons. (to avoid repetitions, subview name: `FetchButton`).
 ✅Extract a sub view for the Character Img Card Part for readability. (subview name: `CharacterCardImgView`).
 ✅ Transferred the `EpisodeView` to `FetchView` file. (No need to separate since only used in that file).
 ✅ Refactor `CharacterView`. ( Extract sub views)
 */

