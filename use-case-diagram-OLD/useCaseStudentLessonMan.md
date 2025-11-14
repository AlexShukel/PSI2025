@startuml Student_Lesson_Management
left to right direction
skinparam packageStyle rectangle
skinparam monochrome true

actor "Student" as Student

rectangle "Lesson Management" {

    usecase (Book a lesson) as UC_RES
    usecase (View lesson list) as UC_VIEW_LESSONS

    usecase (View group lesson list) as UC_VIEW_GRPL
    usecase (Register for group lesson) as UC_GRP_REG
  
    usecase (View reservation list) as UC_VIEW_RES
    usecase (Cancel recurrent reservations) as UC_REC_RES
    usecase (Create reccurent reservation) as UC_RECC_CREATE

    usecase (Filter by criteria) as UC_FILTER_CRIT
}

Student -- UC_VIEW_LESSONS
Student -- UC_VIEW_GRPL

UC_VIEW_RES ..> UC_VIEW_LESSONS : <<extend>>
UC_RES ..> UC_VIEW_LESSONS : <<extend>>
UC_GRP_REG ..> UC_VIEW_GRPL : <<extend>>
UC_REC_RES ..> UC_VIEW_RES : <<extend>>
UC_FILTER_CRIT ..> UC_VIEW_LESSONS : <<extend>>
UC_FILTER_CRIT ..> UC_VIEW_GRPL : <<extend>>
UC_FILTER_CRIT ..> UC_VIEW_RES : <<extend>>
UC_RECC_CREATE ..> UC_VIEW_RES : <<extend>>
@enduml