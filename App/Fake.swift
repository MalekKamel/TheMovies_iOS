//
// Created by Shaban Kamel on 06/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public struct Fake {

    public static func promotion() -> Promotion{
        Promotion(
                promotionId: 1,
                imageid: "",
                startDate: "",
                endDate: "",
                location: "Dubai",
                description: "Description",
                facebookUrl: "URL",
                twitterUrl: "URL",
                instagramUrl: "URL",
                youtubeUrl: "URL",
                websiteUrl: "URL",
                contactNumber: "URL"
        )
    }
}
