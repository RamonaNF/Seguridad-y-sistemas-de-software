//
//  API.swift
//  RRO
//
//  Created by peblo on 25/10/23.
//

import Foundation

struct API {
    // TODO: Change the url with the deployed domain, private ip used for testing
    static let base = "http://127.0.0.1:3000/v1"
    // static let base = "https://us-central1-roberto-ruiz-obregon.cloudfunctions.net/test/v1"
    
    struct routes {
        // TODO: Map all the routes
        static let userSignup = "/user/auth/signup"
        static let userLogin = "/user/auth/login"
        static let userLogout = "/user/auth/logout"
        static let adminSignup = "/admin/auth/signup"
        static let adminLogin = "/admin/auth/login"
        
        static let certification = "/certifications"
        static let course = "/course"
        static let scholarship = "/scholarships"
        static let program = "/program"
        static let event = "/event"
        static let infoFundation = "/informacion-fundacion"
        
        static let myCourses = "/user/mycourses"
        static let courseRating = "/course/updateRating"
    }
}

protocol CourseAPIProtocol {
    // https://{API_DOMAIN}/v1/course?params=val
    func getCourseList() async -> ServerResponse<[Course]>?
    // https://{API_DOMAIN}/v1/course/{id}
    func getCourse(id: String) async -> ServerResponse<[Course]>?
    // https://{API_DOMAIN}/v1/user/mycourses/
    func getMyCourses() async -> ServerResponse<[Course]>?
    // https://{API_DOMAIN}/v1/course/updateRating
    func updateCourseRating(model: Rating) async -> ServerResponse<[Course]>?
}
