// HDDS Consent profile. HL7 Austria's core R4 package does not define
// a Consent profile, so this builds directly on base FHIR R4 Consent.

Profile: HDDSConsent
Parent: Consent
Id: HDDS-consent
Title: "HDDS Consent"
Description: "Minimal Consent profile for the SmartFOX use case: records the patient's consent to share the accompanying Patient and Condition data."
// Darf status nur active sein?
* status 1..1 MS

// Scope of the data donation is always for research
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research "Research"

// The consent we want to display is a patient consent
* category = http://loinc.org#59284-0 "Patient Consent"


// always linking to the Smart FOX Patient
* patient 1..1 MS
* patient only Reference(SmartFOXPatient)



* dateTime 1..1 MS

* sourceAttachment 1..1 MS
* sourceAttachment.url = "https://doi.org/10.1038/s41597-024-03280-6"
* sourceAttachment.title = "Jeanson, F., Gibson, S.J., Alper, P. et al. Getting your DUCs in a row - standardising the representation of Digital Use Conditions. Sci Data 11, 464 (2024)."

* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTINR

* provision 1..1 MS
* provision.type = #deny
* provision.period 1..1 MS

* provision.provision ^slicing.discriminator.type = #value
* provision.provision ^slicing.discriminator.path = "type"
* provision.provision ^slicing.rules = #open
* provision.provision contains
    diagnosisExclusion 1..1 and
    jurisdiction 1..1 and
    profitMotive 1..1 and
    purpose 1..1

* provision.provision[diagnosisExclusion].type 1..1 MS
* provision.provision[diagnosisExclusion].class 1..* MS
* provision.provision[diagnosisExclusion].class from $elga-problemkataloge (required)
* provision.provision[diagnosisExclusion].code 1..* MS

* provision.provision[jurisdiction].type 1..1 MS
* provision.provision[jurisdiction].securityLabel = urn:iso:std:iso:3166:1:alpha-2#EU "European Union"
* provision.provision[jurisdiction].code = http://fhir.ehealth-systems.at/fhir/ValueSet/data-use-categories#regulatory-jurisdiction "Regulatory jurisdiction"

* provision.provision[profitMotive].type 1..1 MS
* provision.provision[profitMotive].code = http://fhir.ehealth-systems.at/fhir/ValueSet/data-use-categories#PROFIT-MOTIVATED "Profit Motivated Use"

* provision.provision[purpose].type 1..1 MS
* provision.provision[purpose].purpose = http://terminology.hl7.org/CodeSystem/v3-ActReason#HRESCH "healthcare research"

