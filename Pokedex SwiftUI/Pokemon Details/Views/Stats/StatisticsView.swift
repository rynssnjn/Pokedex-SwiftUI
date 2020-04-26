//
//  StatisticsView.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct StatisticsView: View {

    // MARK: Initializer
    public init(stats: Stats) {
        self.stats = stats
        self.statistics = [
            Statistic(name: "Attack", value: stats.attack.kio.cgFloatValue, color: Colors.atk),
            Statistic(name: "Defense", value: stats.defense.kio.cgFloatValue, color: Colors.def),
            Statistic(name: "HP", value: stats.hitPoints.kio.cgFloatValue, color: Colors.hp),
            Statistic(name: "Sp. Attack", value: stats.specialAttack.kio.cgFloatValue, color: Colors.spAtk),
            Statistic(name: "Sp. Defence", value: stats.specialDefense.kio.cgFloatValue, color: Colors.spDef),
            Statistic(name: "Speed", value: stats.speed.kio.cgFloatValue, color: Colors.spd)
        ]
    }

    // MARK: Stored Properties
    private let stats: Stats
    private let statistics: [Statistic]

    // MARK: Configured View
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(self.statistics, id: \.name) { statistic in
                BarView(statistic: statistic)
            }
        }
        .background(Color.white)
    }
}

private struct BarView: View {

    // MARK: Initializer
    public init(statistic: Statistic) {
        self.statistic = statistic
    }

    // MARK: Stored Properties
    private let statistic: Statistic

    // MARK: Configured View
    var body: some View {
        let maxWidthValue: CGFloat = UIScreen.main.bounds.width - 100.0 - 10.0 - 5.0 - 10.0
        let widthValue: CGFloat = maxWidthValue / 200.0
        let value: CGFloat = self.statistic.value * widthValue

        return HStack {
            Text("\(self.statistic.value.kio.integerValue)")
                .frame(width: value, height: 30.0)
                .foregroundColor(Color.white)
                .background(self.statistic.color)
                .cornerRadius(20.0)
            Spacer()
            Text(self.statistic.name)
        }
        .padding(.all, 10.0)
    }
}
