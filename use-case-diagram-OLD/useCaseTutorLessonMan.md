@startuml Tutor_Lesson_Management
left to right direction
skinparam packageStyle rectangle
skinparam monochrome true

actor "Tutor" as Tutor

rectangle "Lesson Management" {
  

    usecase (View group lesson list) as UC_VIEW_GRPL
    usecase (Create group lessons) as UC_GRP_CRT
    usecase (Mark specific time slots) as UC_TIME_SLOTS
    usecase (View availability calendar) as UC_CALENDAR_VIEW
    usecase (Edit individual lesson availability) as UC_EDIT_AVAIL
    usecase (View reservation list) as UC_TUT_RES
    usecase (Confirm reservation) as UC_CONF_RES
    usecase (Cancel reservation) as UC_CANCEL_RES
    usecase (Filter by criteria) as UC_FILTER_CRIT
    usecase (Manage recurrent reservations) as UC_MAN_REC
}


Tutor -- UC_CALENDAR_VIEW
UC_EDIT_AVAIL ..> UC_CALENDAR_VIEW : <<extend>>
UC_TIME_SLOTS ..> UC_CALENDAR_VIEW : <<extend>>
Tutor -- UC_TUT_RES

Tutor -- UC_VIEW_GRPL

UC_GRP_CRT ..> UC_VIEW_GRPL : <<extend>>

UC_TUT_RES <.. UC_CONF_RES : <<extend>>
UC_TUT_RES <.. UC_CANCEL_RES : <<extend>>

UC_FILTER_CRIT ..> UC_TUT_RES : <<extend>>
UC_FILTER_CRIT ..> UC_VIEW_GRPL : <<extend>>

UC_MAN_REC ..> UC_TUT_RES : <<extend>>

@enduml