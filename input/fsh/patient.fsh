// SmartFOX Patient profile, built on top of HL7 Austria's AT Core Patient
// profile (which itself constrains base FHIR R4 Patient).

Profile: SmartFOXPatient
Parent: $AT-CORE-PATIENT
Id: smartfox-patient
Title: "SmartFOX Patient"
Description: "Patient profile for the SmartFOX minimal data set. Adds a preferred-contact-method extension on top of the HL7 Austria AT Core Patient profile."
* identifier MS
* name MS
* birthDate 1..1 MS
* gender MS
* extension contains SmartFOXContactPreference named contactPreference 0..1 MS
* extension[contactPreference] ^short = "How the patient prefers to be contacted"

// --- Custom information added for the SmartFOX use case ---

Extension: SmartFOXContactPreference
Id: smartfox-contact-preference
Title: "Preferred Contact Method"
Description: "The patient's preferred method of contact, used by the SmartFOX application to decide how to reach out."
* value[x] only CodeableConcept
* valueCodeableConcept from SmartFOXContactPreferenceVS (required)

CodeSystem: SmartFOXContactPreferenceCS
Id: smartfox-contact-preference-cs
Title: "SmartFOX Contact Preference Codes"
Description: "Codes for a patient's preferred contact method."
* #phone "Phone"
* #email "Email"
* #letter "Letter"
* #app "SmartFOX App"

ValueSet: SmartFOXContactPreferenceVS
Id: smartfox-contact-preference-vs
Title: "SmartFOX Contact Preference Value Set"
Description: "Value set of preferred contact methods for the SmartFOX use case."
* codes from system SmartFOXContactPreferenceCS
