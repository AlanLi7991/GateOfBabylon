//
//  ContentView.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/12/8.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let runes:[GOBSampleRune] = [
        GOBCollectionController.rune(),
        GOBScaleImageController.rune(),
        GOBInformationController.rune(),
        GOBStorePhotosController.rune()
    ]
    
    var body: some View {
        NavigationView {
            List(runes) { rune in
                NavigationLink(
                    destination: GOBViewControllerWrapper(type: rune.clazz)
                        .navigationBarTitle(Text(rune.title), displayMode: .inline)
                ) {
                    Text(rune.title)
                    Spacer()
                    Text(rune.decription)
                }
            }.navigationBarTitle("Babylon Treasures", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
