// The HDDS minimal set: exactly one HDDSPatient plus one or more
// MinimalCondition resources, packaged together in a single Bundle.

Profile: HDDSMinimalSetBundle
Parent: Bundle
Id: hdds-minimal-set-bundle
Title: "HDDS Minimal Set Bundle"
Description: "The minimal FHIR data set for the HDDS use case: one Patient, one or more Condition resources, and the patient's Consent to share them, conforming to the HDDS profiles, in a single collection Bundle."
* type = #collection
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    patient 1..1 and
    condition 0..* and
    consent 1..1
* entry[patient].resource only HDDSPatient
* entry[condition].resource only MinimalCondition
* entry[consent].resource only HDDSConsent
