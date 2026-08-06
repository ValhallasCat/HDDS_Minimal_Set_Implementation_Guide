Instance: SmartFOXPatientExample
InstanceOf: SmartFOXPatient
Usage: #example
Title: "SmartFOX Patient Example"
* identifier.system = "http://example.org/fhir/identifier/patient-id"
* identifier.value = "12345"
* name.family = "Muster"
* name.given[0] = "Maria"
* gender = #female
* birthDate = "1980-05-12"
* extension[contactPreference].valueCodeableConcept = SmartFOXContactPreferenceCS#email

Instance: SmartFOXConditionExample
InstanceOf: SmartFOXCondition
Usage: #example
Title: "SmartFOX Condition Example"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code = $sct#73211009 "Diabetes mellitus (disorder)"
* subject = Reference(SmartFOXPatientExample)
* onsetDateTime = "2022-03-01"
* extension[priorityNote].valueString = "Routine follow-up, no urgent action needed."

Instance: SmartFOXConsentExample
InstanceOf: SmartFOXConsent
Usage: #example
Title: "SmartFOX Consent Example"
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#INFA
* patient = Reference(SmartFOXPatientExample)
* dateTime = "2022-03-01"
* extension[consentPurposeNote].valueString = "Consent to share condition data with the SmartFOX application."

Instance: SmartFOXMinimalSetBundleExample
InstanceOf: SmartFOXMinimalSetBundle
Usage: #example
Title: "SmartFOX Minimal Set Bundle Example"
* type = #collection
* entry[patient].fullUrl = "http://example.org/fhir/Patient/SmartFOXPatientExample"
* entry[patient].resource = SmartFOXPatientExample
* entry[condition][0].fullUrl = "http://example.org/fhir/Condition/SmartFOXConditionExample"
* entry[condition][0].resource = SmartFOXConditionExample
* entry[consent].fullUrl = "http://example.org/fhir/Consent/SmartFOXConsentExample"
* entry[consent].resource = SmartFOXConsentExample
