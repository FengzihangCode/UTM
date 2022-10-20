//
// Copyright © 2020 osy. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

struct VMPlaceholderView: View {
    @EnvironmentObject private var data: UTMData
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack {
            HStack {
                Text("Welcome to UTM").font(.title)
            }
            HStack {
                TileButton(Label(String.create, systemImage: "plus.circle")) {
                    data.newVM()
                }
                TileButton(Label(String.browse, systemImage: "arrow.down.circle")) {
                    openURL(URL(string: "https://mac.getutm.app/gallery/")!)
                }
            }
            HStack {
                TileButton(Label(String.guide, systemImage: "book.circle")) {
                    openURL(URL(string: "https://docs.getutm.app/basics/basics/")!)
                }
                TileButton(Label(String.support, systemImage: "questionmark.circle")) {
                    openURL(URL(string: "https://docs.getutm.app/")!)
                }
            }
        }
    }
}

fileprivate extension String {
    static let create = NSLocalizedString("Create a New Virtual Machine", comment: "Welcome view")
    static let browse = NSLocalizedString("Browse UTM Gallery", comment: "Welcome view")
    static let guide = NSLocalizedString("User Guide", comment: "Welcome view")
    static let support = NSLocalizedString("Support", comment: "Welcome view")
}

private struct TileButton: View {
    let label: Label<Text, Image>
    let action: () -> Void
    
    init(_ label: Label<Text, Image>, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            label
                .labelStyle(TileLabelStyle())
        }).buttonStyle(BigButtonStyle(width: 150, height: 150))
    }
}


private struct TileLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
                .font(.system(size: 48.0, weight: .medium))
                .padding(.bottom)
            configuration.title
                .multilineTextAlignment(.center)
        }
    }
}

struct VMPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        VMPlaceholderView()
    }
}
