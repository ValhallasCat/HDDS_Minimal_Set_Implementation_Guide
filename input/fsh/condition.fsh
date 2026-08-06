// SmartFOX Condition profile. HL7 Austria's core R4 package does not define
// a Condition profile, so this builds directly on base FHIR R4 Condition.

Profile: SmartFOXCondition
Parent: Condition
Id: smartfox-condition
Title: "SmartFOX Condition"
Description: "Minimal Condition profile for the SmartFOX use case: the condition must be linked to a SmartFOX Patient and carries an optional local priority note."
* clinicalStatus 1..1 MS
* verificationStatus 1..1 MS
* code 1..1 MS
* subject 1..1 MS
* subject only Reference(SmartFOXPatient)
* onset[x] MS
* extension contains SmartFOXConditionPriorityNote named priorityNote 0..1 MS
* extension[priorityNote] ^short = "Local free-text triage priority note"

// --- Custom information added for the SmartFOX use case ---

Extension: SmartFOXConditionPriorityNote
Id: smartfox-condition-priority-note
Title: "Condition Priority Note"
Description: "Free-text note describing the clinical priority/urgency of this condition, for local triage purposes within SmartFOX."
* value[x] only string
