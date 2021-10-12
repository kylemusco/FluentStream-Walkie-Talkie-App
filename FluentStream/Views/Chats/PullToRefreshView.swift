//
//  PullToRefreshView.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI

struct PullToRefreshView: View {
    var coordinateSpaceName: String
    var onRefresh: ()->Void
       
    @State var needRefresh: Bool = false
    
    var body: some View {
            GeometryReader { geo in
                if (geo.frame(in: .named(coordinateSpaceName)).midY > 80) {
                    Spacer()
                        .onAppear {
                            needRefresh = true
                        }
                } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                    Spacer()
                        .onAppear {
                            if needRefresh {
                                needRefresh = false
                                onRefresh()
                            }
                        }
                }
            }.padding(.top, -50)
        }
}
