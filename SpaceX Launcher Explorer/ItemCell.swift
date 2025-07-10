//
//  ItemCell.swift
//  SpaceX Launcher Explorer
//
//  Created by Asif Seraje on 7/10/25.
//

import SwiftUI

struct ItemCell: View {
    let item: SpaceXItems

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: URL(string: item.links?.mission_patch_small ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 6) {
                Text(item.mission_name ?? "").font(.headline)
                Text(item.launch_date_utc ?? "").font(.subheadline)
                Text(item.launch_success?.description ?? "").font(.footnote).foregroundColor(.gray)
                Text(item.details ?? "").font(.caption).foregroundColor(.blue)
            }
        }
        .padding(.vertical, 8)
    }
}
