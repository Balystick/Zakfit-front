//
//  Meal.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//
import Foundation

struct Meal {
    let id: UUID
    let dateTime: String
    let totalCalories: Double
    let totalFats: Double
    let totalProteins: Double
    let totalCarbs: Double
    let mealTypeName: String
}
