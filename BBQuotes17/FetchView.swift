//
//  QuoteView.swift
//  BBQuotes17
//
//  Created by Lyle Dane Carcedo on 11/29/24.
//

import SwiftUI

struct FetchView: View {
    let vm = ViewModel()
    let show: String
    @State var showCharacterInfo = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundImgView(imageName: show.removeWhiteSpaceAndConvertToPascal())
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 60)
                        switch vm.status {
                        case .notStarted:
                            EmptyView()
                        case .fetching:
                            ProgressView()
                        case .successQuote:
                            Text("\"\(vm.quote.quote)\"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .clipShape(.rect(cornerRadius: 25))
                                .padding(.horizontal)
                            Spacer()
                            CharacterCardImgView(
                                vm: vm,
                                geo: geo,
                                onTap: {
                                    showCharacterInfo.toggle()
                                }
                            )
                        case .successEpisode:
                            EpisodeView(episode: vm.episode)
                        case .failed(error:let error):
                            Text(error.localizedDescription)
                        }
                        Spacer(minLength:  20)
                    }
                    
                    HStack {
                        FetchButton(
                            title: "Get Random Quote",
                            show: show,
                            action: {
                                Task {
                                    await vm.getQuoteData(for: show)
                                }
                            }
                        )
                        Spacer(minLength: 20)
                        FetchButton(
                            title: "Get Random Episode",
                            show: show,
                            action: {
                                Task {
                                    await vm.getEpisode(for: show)
                                }
                            }
                        )
                    }
                    .padding(.horizontal, 30)
                    Spacer(minLength:  95)
                }
                .frame(width:geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showCharacterInfo) {
            CharacterView(character: vm.character, show: show)
        }
    }
    
    private struct FetchButton: View {
        let title: String
        let show: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(title)
            }
            .font(.title3)
            .foregroundStyle(.white)
            .padding()
            .background(Color(show.generateButtonAssetName()))
            .clipShape(.rect(cornerRadius: 7))
            .shadow(color: Color(show.generateShadowAssetName()), radius: 2)
        }
    }
    
    private struct CharacterCardImgView: View {
        let vm: ViewModel
        let geo: GeometryProxy
        let onTap: () -> Void
        
        var body: some View {
            ZStack(alignment: .bottom) {
                AsyncImage(url: vm.character.images.first) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width:geo.size.width/1.1, height: geo.size.height/1.8)
                Text (vm.quote.character)
                    .foregroundStyle(.white)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
            }
            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
            .clipShape(.rect(cornerRadius: 50))
            .onTapGesture {
                onTap()
            }
        }
    }
    
    private struct EpisodeView: View {
        let episode: Episode
        
        var body: some View {
            VStack(alignment: .leading) {
                BBText.largeTitle(episode.title)
                BBText.title2(episode.seasonEpisode)
                
                AsyncImage(url: episode.image) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius:15))
                } placeholder: {
                    ProgressView()
                }
                BBText.title3(episode.synopsis)
                    .minimumScaleFactor(0.5)
                    .padding(.bottom)
                BBText.defaultText("Written By: \(episode.writtenBy)")
                BBText.defaultText("Directed By: \(episode.directedBy)")
                BBText.defaultText("Aired: \(episode.airDate)")
            }
            .padding()
            .foregroundStyle(.white)
            .background(.black.opacity(0.6))
            .clipShape(.rect(cornerRadius: 25))
            .padding(.horizontal)
        }
    }
}



#Preview {
    FetchView(show: Constants.breakingBadName)
        .preferredColorScheme(.dark)
}
