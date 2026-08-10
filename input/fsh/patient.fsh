// HDDS Patient profile, built on top of HL7 Austria's AT Core Patient
// profile (which itself constrains base FHIR R4 Patient).

Profile: HDDSPatient
Parent: $at-core-patient
Id: hdds-patient
Title: "HDDS Patient"
Description: "Patient profile for the SmartFOX minimal data set. Adds a preferred-contact-method extension on top of the HL7 Austria AT Core Patient profile."
* name.id 1..1 MS
* birthDate 1..1 MS
* birthDate obeys hdds-birthdate-year-only
* gender 1..1 MS

// The URL a patient wants to be contacted by (e.g. a video-call or messaging link)
* telecom MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains contactUrl 0..1 MS
* telecom[contactUrl].system = #url
* telecom[contactUrl].value 1..1 MS

// The postal code must be given 

* address.country 1..1 MS
* address.postalCode 1..1 MS



Invariant: hdds-birthdate-year-only
Description: "birthDate must be reduced to year precision for privacy, represented as 1 January of the birth year (YYYY-01-01)."
Severity: #error
Expression: "toString().matches('^[0-9]{4}-01-01$')"

