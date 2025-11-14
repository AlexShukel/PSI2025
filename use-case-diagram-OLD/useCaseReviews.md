@startuml Reviews_Feedback
left to right direction
skinparam packageStyle rectangle
skinparam monochrome true

actor "Student" as Student

rectangle "Reviews" {
  usecase (Leave feedback) as UC_REV
  usecase (Write comment) as UC_COMMENT
}

Student -- UC_REV

UC_REV <.. UC_COMMENT : <<extend>>

@enduml