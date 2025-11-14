@startuml Administrative_Operations
top to bottom direction
skinparam packageStyle rectangle
skinparam monochrome true
actor "Administrator" as Admin

rectangle "Administrative Operations" {
  
  rectangle "User Management" {
    usecase (Filter by criteria) as UC_FILTER_CRIT
    usecase (View all users) as UC_VIEW_USR
    usecase (Block/Unblock user) as UC_BLOCK_USR
    usecase (Add administrator) as UC_ADD_ADMIN
    usecase (Show unapproved tutors) as UC_UNAPPLIST_TUT
    usecase (Approve tutor) as UC_APPROVE_TUT
    usecase (Reject tutor) as UC_REJECT_TUT
  }

  rectangle "System Configuration" {
    usecase (View subject list) as UC_SUBJ_LIST
    usecase (Manage subjects) as UC_MAN_SUB
    usecase (Filter by criteria) as UC_FILTER_CRIT
  }
  
  rectangle "Support" {
    usecase (Handle disputes) as UC_DISPUTE
  }
}


Admin -- UC_VIEW_USR

Admin -- UC_SUBJ_LIST
Admin -- UC_DISPUTE

UC_BLOCK_USR ..> UC_VIEW_USR : <<extend>>
UC_ADD_ADMIN ..> UC_VIEW_USR : <<extend>>
UC_FILTER_CRIT ..> UC_VIEW_USR : <<extend>>
UC_UNAPPLIST_TUT --|> UC_FILTER_CRIT
UC_APPROVE_TUT ..> UC_UNAPPLIST_TUT : <<extend>>
UC_REJECT_TUT ..>  UC_UNAPPLIST_TUT : <<extend>>
UC_SUBJ_LIST <.. UC_MAN_SUB : <<extend>>

@enduml