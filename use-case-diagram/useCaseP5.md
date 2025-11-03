@startuml Financial_Management
top to bottom direction
skinparam packageStyle rectangle

actor "Student" as Student

rectangle "Credits and Payments" {
  usecase (View balance) as UC_VIEW_BAL
  usecase (Buy credits) as UC_CRED
  usecase (Request credit refund) as UC_REFUND
}

Student --> UC_VIEW_BAL
Student --> UC_CRED
Student --> UC_REFUND

@enduml