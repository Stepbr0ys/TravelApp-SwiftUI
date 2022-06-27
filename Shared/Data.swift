//
//  Data.swift
//  Prtfl3
//
//  Created by Борис Ларионов on 20.01.2022.
//

import SwiftUI

enum category : String {
    case places
    case inspiration
    case emotions
}

enum selectedTab : String {
    case home
    case info
}

struct Category : Identifiable {
    var id = UUID()
    var category : category
    var name: String
}

var categories = [
    Category(category: .places, name: "Places"),
    Category(category: .inspiration, name: "Inspiration"),
    Category(category: .emotions, name: "Emotions")
]

struct Card : Identifiable, Hashable {
    var id = UUID()
    var index: Int
    var name: String
    var image: String
    var coords: String
    var icon: String
    var price: String
    var description: String
}

var cards = [
    Card(index: 0, name: "Cascade", image: "Mountain 1", coords: "Canada, Baniff", icon: "mappin", price: "$ 250", description: "The Cascade Range or Cascades is a major mountain range of western North America, extending from southern British Columbia through Washington and Oregon to Northern California. It includes both non-volcanic mountains, such as the North Cascades, and the notable volcanoes known as the High Cascades. The small part of the range in British Columbia is referred to as the Canadian Cascades or, locally, as the Cascade Mountains. The latter term is also sometimes used by Washington residents to refer to the Washington section of the Cascades in addition to North Cascades, the more usual U.S. term, as in North Cascades National Park. The highest peak in the range is Mount Rainier in Washington at 14,411 feet (4,392 m)."),
    Card(index: 1, name: "Yosemite", image: "Mountain 2", coords: "USA, California", icon: "mappin",  price: "$ 69", description: "Yosemite National Park (/joʊˈsɛmɪti/ yoh-SEM-it-ee) is an American national park in the western Sierra Nevada of Central California, bounded on the southeast by Sierra National Forest and on the northwest by Stanislaus National Forest. The park is managed by the National Park Service and covers an area of 748,436 acres (1,169 sq mi; 3,029 km2) and sits in four counties: centered in Tuolumne and Mariposa, extending north and east to Mono and south to Madera County."),
    Card(index: 2, name: "Ahhka", image: "Mountain 3", coords: "Sweden, Norrbotten County", icon: "mappin",  price: "$ 1200", description: "The massif has twelve individual peaks and ten glaciers,[1] of which Stortoppen is the highest at 2,015 metres (6,611 feet). This peak is the eighth-highest in Sweden. Most notable is that the mountain has a vertical drop of 1,563 m (5,128 ft), from the top of the highest summit down to the lake Akkajaure in the valley below, which is located at 453 m (1,486 ft). This is the highest vertical drop found in Sweden. Since the lake below the mountain is regulated by a hydroelectric power station, its surface can drop down to 423 m (1,388 ft), which makes the mountain's vertical drop rise to a maximum of 1,593 m (5,226 ft). Due to the large level differences and the massif being well held together and rather isolated, it looks impressive, earning it the nickname Queen of Lapland. In the Sámi tradition it is a holy mountain, and some hikers regard it with a sense of awe and mystique."),
    Card(index: 3, name: "Trolltunga", image: "Mountain 4", coords: "Norway, Vestland", icon: "mappin",  price: "$ 6969", description: "Popularity of the hike to Trolltunga and rock formation itself has exploded in recent years. The increased popularity has turned Trolltunga into a national icon and a major tourist attraction for the region. Until 2010, fewer than 800 people hiked to Trolltunga each year. In 2016 more than 80,000 people hiked[3] the 27-kilometre (17 mi) round-trip from the village of Skjeggedal, making it one of Norway's most popular hikes.[4]"),
]

struct Star : Identifiable {
    var id = UUID()
    var count: Int
}

var stars = [
    Star(count: 1),
    Star(count: 2),
    Star(count: 3),
    Star(count: 4),
    Star(count: 5)
]

struct People : Identifiable {
    var id = UUID()
    var count: Int
}

var people = [
    People(count: 1),
    People(count: 2),
    People(count: 3),
    People(count: 4),
    People(count: 5)
]

struct Explore : Identifiable, Hashable {
    var id = UUID()
    var name: String
    var icon: String
    var color: Color
}

var exploreIcons = [
    Explore(name: "Kayaking", icon: "Kayaking icon", color: Color(#colorLiteral(red: 0.6142355204, green: 0.6304805279, blue: 0.7747601867, alpha: 1))),
    Explore(name: "Snorkeling", icon: "Snorkerling icon", color: Color(#colorLiteral(red: 0.963152349, green: 0.7730874419, blue: 0.3967684805, alpha: 1))),
    Explore(name: "Balloning", icon: "Balloning icon", color: Color(#colorLiteral(red: 0.6799585223, green: 0.6200989485, blue: 0.7373178601, alpha: 1))),
    Explore(name: "Hikking", icon: "Hikking icon", color: Color(#colorLiteral(red: 0.4499796033, green: 0.7324780822, blue: 0.7237058282, alpha: 1))),
]
