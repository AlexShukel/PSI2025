@startuml Lesson_Management
left to right direction
skinparam packageStyle rectangle

actor "Student" as Student
actor "Tutor" as Tutor

rectangle "Lesson Management" {
  
  package "Availability Management" {
    usecase (Manage availability calendar) as UC_CAL
    usecase (Mark specific time slots) as UC_TIME_SLOTS
  }
  
  package "Individual Lessons" {
    usecase (Book a lesson) as UC_RES
    usecase (Check availability) as UC_CHK_AVAIL
    usecase (Manage reservations) as UC_MAN_RES
    usecase (Confirm reservation) as UC_CONF_RES
    usecase (Cancel reservation) as UC_CANCEL_RES
    usecase (View reservation status) as UC_VIEW_RES
  }
  
  package "Group Lessons" {
    usecase (Create group lessons) as UC_GRP_CRT
    usecase (Register for group lesson) as UC_GRP_REG
  }
}

Tutor --> UC_CAL
Tutor --> UC_MAN_RES
Tutor --> UC_GRP_CRT

Student --> UC_RES
Student --> UC_GRP_REG
Student --> UC_VIEW_RES

UC_CAL ..> UC_TIME_SLOTS : <<include>>
UC_RES ..> UC_CHK_AVAIL : <<include>>
UC_MAN_RES ..> UC_CONF_RES : <<include>>
UC_MAN_RES ..> UC_CANCEL_RES : <<include>>

@enduml