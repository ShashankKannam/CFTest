//
//  CarDetails.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

public struct CarDetails: Codable {
    var backfillCount: Int?
    var breadCrumbs: [BreadCrumbs]?
    var dealerNewCount: Int?
    var dealerUsedCount: Int?
    var enhancedCount: Int?
    var facetCountMap: FacetCountMap?
    var listings:[Listings]?
    var page: Int?
    var pageSize: Int?
    var relatedLinks: RelatedLinks?
    var searchArea: SearchArea?
    var searchRequest: SearchRequest?
    var seoUrl: String?
    var totalListingCount: Int?
    var totalPageCount: Int?
}

struct RelatedLinks: Codable {
    var acuraLevels: [RelatedData]?
    var similarCars: [RelatedData]?
    var usedAcura: [RelatedData]?
    
    enum CodingKeys: String, CodingKey {
        case acuraLevels = "Acura ILX Trim Levels"
        case similarCars = "Similar Cars"
        case usedAcura = "Used Acura ILX by Year"
    }
}

struct RelatedData: Codable {
    var count: Int?
    var text: String?
    var url: String?
}

struct SearchRequest: Codable {
    var make: String?
    var mileageRange: MileageRange?
    var model: String?
    var priceRange: PriceRange
    var radius: Int?
    var srpUrl: String?
    var webHost: String?
    var yearRange: YearRange?
    var zip: String?
}

struct FacetCountMap: Codable {
    var bedType: Facets?
    var bodyStyle: Facets?
    var cabType: Facets?
    var driveType: Facets?
    var engines: Facets?
    var exteriorColor: Facets?
    var fuelType: Facets?
    var interiorColor: Facets?
    var make: Facets?
    var makeModelOnly: Facets?
    var mileageRange: Facets?
    var model: Facets?
    var noAccidents: Facets?
    var oneOwner: Facets?
    var options: Facets?
    var personalUse: Facets?
    var pillarCombos: Facets?
    var popularOptions: Facets?
    var price: Facets?
    var serviceRecords: Facets?
    var transmission: Facets?
    var trim: Facets?
    var yearRange: Facets?
    
}

struct Facets: Codable {
    var facets: [FacetsSpecific]?
}

struct FacetsSpecific: Codable {
    var encodedName: String?
    var name: String?
    var value: Int?
}

struct MileageRange: Codable {
    var max: Int?
    var min: Int?
}

struct PriceRange: Codable {
    var min: Int?
}

struct YearRange: Codable {
    var max: Int?
    var min: Int?
}

struct SearchArea: Codable {
    var city: String?
    var dynamicRadii: [Int]?
    var dynamicRadius: Bool?
    var latitude: Double?
    var longitude: Double?
    var radius: Int?
    var state: String?
    var zip: String?
}

struct BreadCrumbs: Codable {
    var label: String?
    var link: String?
    var position: Int?
}

struct Listings: Codable {
    var accidentHistory: AccidentHistory?
    var advantage: Bool?
    var backfill: Bool?
    var badge: String?
    var bedLength: String?
    var bodytype: String?
    var cabType: String?
    var certified: Bool
    var currentPrice: Int?
    var dealer: Dealer?
    var dealerType: String?
    var displacement: String?
    var distanceToDealer: Double?
    var drivetype: String?
    var engine: String?
    var exteriorColor: String?
    var firstSeen: String?
    var followCount: Int?
    var following: Bool?
    var fuel: String?
    var hasViewed: Bool?
    var id: String?
    var imageCount: Int?
    var images: CarImages?
    var interiorColor: String?
    var isEnriched: Bool?
    var listPrice: Int?
    var listingStatus: String?
    var make: String?
    var mileage: Int?
    var model: String?
    var monthlyPaymentEstimate: MonthlyPaymentEstimate?
    var mpgCity: Int?
    var mpgHighway: Int?
    var noAccidents: Bool?
    var oneOwner: Bool?
    var onePrice: Int?
    var onePriceArrows: [OnePriceArrows]?
    var onlineOnly: Bool?
    var ownerHistory: OwnerHistory?
    var personalUse: Bool?
    var recordType: String?
    var sentLead: Bool?
    var serviceHistory: ServiceHistory?
    var serviceRecords: Bool?
    var sortScore: Double?
    var stockNumber: String?
    var subTrim: String?
    var topOptions: [String]?
    var transmission: String?
    var trim: String?
    var vdpUrl: String?
    var vehicleCondition: String?
    var vehicleUseHistory: VehicleUseHistory?
    var vin: String?
    var year: Int?
}

struct OnePriceArrows: Codable {
    var arrow: String?
    var arrowUrl: String?
    var icon: String?
    var iconUrl: String?
    var order: Int?
    var text: String?
}

struct OwnerHistory: Codable {
    var history: [OwnerSpecificHistory]?
    var icon: String?
    var iconUrl: String?
    var text: String?
}

struct OwnerSpecificHistory: Codable {
    var endOwnershipDate: String?
    var ownerNumber: Int?
    var purchaseDate: String?
    var state: String?
}

struct ServiceHistory: Codable {
    var history: [History]?
    var icon: String?
    var iconUrl: String?
    var number: Int?
    var text: String?
}

struct History: Codable {
    var city: String?
    var date: String?
    var description: String?
    var odometerReading: Int?
    var source: String?
    var state: String?
}

struct VehicleUseHistory: Codable {
    var history: [VehicleHistory]?
    var icon: String?
    var iconUrl: String?
    var text: String?
}

struct VehicleHistory: Codable {
    var averageMilesPerYear: Int?
    var ownerNumber: Int?
    var useType: String?
}

struct AccidentHistory: Codable {
    var accidentSummary: [String]?
    var icon: String?
    var iconUrl: String?
    var text: String?
}

struct Dealer: Codable {
    var address: String?
    var carfaxId: String?
    var cfxMicrositeUrl: String?
    var city: String?
    var dealerAverageRating: Double?
    var dealerInventoryUrl: String?
    var dealerLeadType: String?
    var dealerReviewComments: String?
    var dealerReviewCount: Int?
    var dealerReviewDate: String?
    var dealerReviewRating: Int?
    var dealerReviewReviewer: String?
    var dealerReviewTitle: String?
    var latitude: String?
    var longitude: String?
    var name: String?
    var onlineOnly: Bool?
    var phone: String?
    var state: String?
    var zip: String?
}

struct CarImages: Codable {
    var baseUrl: String?
    var firstPhoto: ImageVariations?
    var large: [String]?
    var medium: [String]?
    var small: [String]?
}

struct ImageVariations: Codable {
    var large: String?
    var medium: String?
    var small: String?
}

struct MonthlyPaymentEstimate: Codable {
    var downPaymentAmount: Double?
    var downPaymentPercent: Int?
    var interestRate: Int?
    var loanAmount: Double?
    var monthlyPayment: Double?
    var price: Int?
    var termInMonths: Int?
}
