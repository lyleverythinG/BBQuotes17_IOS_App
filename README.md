# Breaking Bad IOS App(Swift)
_This simple app is made with Swift and is the third app I created in this language as I continue in leaning ios development._
# NOTE
- I followed a Udemy course, which is this one: https://www.udemy.com/course/ios-15-app-development-with-swiftui-3-and-swift-5/..
- After I finished the first app from the course, I made changes to the project for practice and learning purposes.
- The code structure in this project is not perfect, as I just started learning ios development. I've created this repository to track my progress as I work on more projects in the future.
# My Changes
- Added reusable/sub views.
- Added `BBText` for reusability of text.
- Created `BackgroundImgView` for reusability of Image().resizable().
- Added comments
- Added helper method in content view.
- Updated `Constants` enum structure.
- Created a sub view in `FetchView` for the two buttons. (to avoid repetitions, subview name: `FetchButton`).
- Extract a sub view for the Character Img Card Part for readability. (subview name: `CharacterCardImgView`).
- Transferred the `EpisodeView` to `FetchView` file. (No need to separate since only used in that file).
- Refactor `CharacterView`. ( Extract sub views)
# SETUP
- Add your own API key inside the `ExchangeRateService` file. Create your key here: Link: https://freecurrencyapi.com/
