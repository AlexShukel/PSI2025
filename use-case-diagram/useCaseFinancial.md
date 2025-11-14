@startuml Financial_Management
top to bottom direction
skinparam packageStyle rectangle
skinparam monochrome true

actor "Student" as Student

rectangle "Credits and Payments" {
  usecase (View balance) as UC_VIEW_BAL
  usecase (Buy credits) as UC_CRED
  usecase (Request credit refund) as UC_REFUND
}

Student -- UC_VIEW_BAL


UC_VIEW_BAL <.. UC_REFUND : <<extend>>
UC_VIEW_BAL <.. UC_CRED : <<extend>>

@enduml