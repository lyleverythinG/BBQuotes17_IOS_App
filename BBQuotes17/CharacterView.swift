//
//  CharacterView.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/30/24.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    let show: String
    var body: some View {
        GeometryReader { geo in
            ScrollViewReader { proxy in
                ZStack(alignment: .top) {
                    // Top background image
                    BackgroundImgView(imageName:show.removeWhiteSpaceAndConvertToPascal())
                        .scaledToFit()
                    
                    ScrollView {
                        // Character Image Carousel View
                        TabView {
                            ForEach(character.images,id: \.self) { characterImageURL in
                                AsyncImage(url: characterImageURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(width:geo.size.width/1.2, height: geo.size.height/1.7)
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.top,60)
                        VStack(alignment: .leading) {
                            CharacterDetailsSection(character: character)
                            Divider()
                            OccupationsSection(character: character)
                            Divider()
                            NicknamesSection(character: character)
                            Divider()
                            StatusSection(character: character, proxy: proxy, geo: geo)
                        }
                        .frame(width:geo.size.width/1.25, alignment: .leading)
                        .padding()
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    
    private struct CharacterDetailsSection: View {
        let character: Character
        
        var body: some View {
            BBText.largeTitle(character.name)
            BBText.subHeadline("Portrayed By: \(character.portrayedBy)")
            Divider()
            BBText.title2("\(character.name) Character Info")
            BBText.defaultText("Born: \(character.birthday)")
            
        }
    }
    
    private struct OccupationsSection: View {
        let character: Character
        
        var body: some View {
            BBText.defaultText("Occupations:")
            
            ForEach(character.occupations, id: \.self) { occupation in
                BBText.subHeadline("•\(occupation)")
            }
        }
    }
    
    private struct NicknamesSection: View {
        let character: Character
        
        var body: some View {
            BBText.defaultText("Nicknames:")
            
            if character.aliases.count > 0 {
                ForEach(character.aliases, id: \.self) { alias in
                    BBText.subHeadline("•\(alias)")
                }
            } else {
                BBText.subHeadline("None")
            }
        }
    }
    
    private struct StatusSection: View {
        let character: Character
        let proxy: ScrollViewProxy
        let geo: GeometryProxy
        
        var body: some View {
            DisclosureGroup("Status (spoiler alert!)") {
                VStack(alignment: .leading)  {
                    BBText.title2(character.status)
                    
                    if let death = character.death {
                        AsyncImage(url: death.image) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 15))
                                .onAppear {
                                    withAnimation{
                                        proxy.scrollTo(1, anchor:.bottom)
                                    }
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        BBText.defaultText("How: \(death.details)")
                            .padding(.bottom, 7)
                        BBText.defaultText("Last words: \"\(death.lastWords)\"")
                    }
                }
                .frame(width:geo.size.width/1.25, alignment: .leading)
                .padding(.bottom, 50)
            }
            .id(1)
        }
    }
}

#Preview {
    CharacterView(character: ViewModel().character, show: Constants.breakingBadName)
}
