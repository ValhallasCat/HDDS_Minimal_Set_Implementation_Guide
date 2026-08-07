// SmartFOX Condition profile. HL7 Austria's core R4 package does not define
// a Condition profile, so this builds directly on base FHIR R4 Condition.

Profile: MinimalCondition
Parent: Condition
Id: smartfox-condition
Title: "SmartFOX Condition"
Description: "Minimal Condition profile for a valid data donation for a FOX BOX"
* clinicalStatus 1..1 MS
// Hier ein binding machen, dass es confirmed sein muss?
* verificationStatus 1..1 MS

// The diagnosis code must be from the ELGA_Problemkataloge
* code 1..1 MS
* code from $elga-problemkataloge (required)

// The subject must be a SmartFOX confirm patient
* subject 1..1 MS
* subject only Reference(SmartFOXPatient)

// Since when the Diagnosis began, estimated by the clinician
* onset[x] 0..1 MS

// Date the diagnosis was officially recorded
* recordedDate 1..1 MS


