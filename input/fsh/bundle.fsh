// The SmartFOX minimal set: exactly one SmartFOXPatient plus one or more
// MinimalCondition resources, packaged together in a single Bundle.

Profile: SmartFOXMinimalSetBundle
Parent: Bundle
Id: smartfox-minimal-set-bundle
Title: "SmartFOX Minimal Set Bundle"
Description: "The minimal FHIR data set for the SmartFOX use case: one Patient, one or more Condition resources, and the patient's Consent to share them, conforming to the SmartFOX profiles, in a single collection Bundle."
* type = #collection
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    patient 1..1 and
    condition 0..* and
    consent 1..1
* entry[patient].resource only SmartFOXPatient
* entry[condition].resource only MinimalCondition
* entry[consent].resource only HDDSConsent
