// HDDS Consent profile. HL7 Austria's core R4 package does not define
// a Consent profile, so this builds directly on base FHIR R4 Consent.

Profile: HDDSConsent
Parent: Consent
Id: HDDS-consent
Title: "HDDS Consent"
Description: "Minimal Consent profile for the HDDSuse case: records the patient's consent to share the accompanying Patient and Condition data."
// Darf status nur active sein?
* status 1..1 MS

// Scope of the data donation is always for research
* scope = http://terminology.hl7.org/CodeSystem/consentscope#research "Research"

// The consent we want to display is a patient consent
* category = http://loinc.org#59284-0 "Einwilligung - Dokument"


// always linking to the HDDSPatient
* patient 1..1 MS
* patient only Reference(HDDSPatient)



* dateTime 1..1 MS

* sourceAttachment 1..1 MS
* sourceAttachment.url = "https://doi.org/10.1038/s41597-024-03280-6"
* sourceAttachment.title = "Jeanson, F., Gibson, S.J., Alper, P. et al. Getting your DUCs in a row - standardising the representation of Digital Use Conditions. Sci Data 11, 464 (2024)."

* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTINR

* provision 1..1 MS
* provision.type 1..1 MS
* provision.period 1..1 MS

* provision.provision ^slicing.discriminator[+].type = #exists
* provision.provision ^slicing.discriminator[=].path = "class"
* provision.provision ^slicing.discriminator[+].type = #exists
* provision.provision ^slicing.discriminator[=].path = "securityLabel"
* provision.provision ^slicing.discriminator[+].type = #exists
* provision.provision ^slicing.discriminator[=].path = "code"
* provision.provision ^slicing.discriminator[+].type = #exists
* provision.provision ^slicing.discriminator[=].path = "purpose"
* provision.provision ^slicing.rules = #open
* provision.provision contains
    diagnosisExclusion 0..1 and
    jurisdiction 0..1 and
    profitMotive 0..1 and
    purpose 0..1

* provision.provision[diagnosisExclusion].type 1..1 MS
* provision.provision[diagnosisExclusion].class 1..* MS
* provision.provision[diagnosisExclusion].class from $elga-problemkataloge (extensible)
* provision.provision[diagnosisExclusion].code 1..* MS
* provision.provision[diagnosisExclusion].code from $common-condition-use (required)
* provision.provision[diagnosisExclusion].securityLabel 0..0
* provision.provision[diagnosisExclusion].purpose 0..0

* provision.provision[jurisdiction].type 1..1 MS
* provision.provision[jurisdiction].securityLabel 1..1 MS
* provision.provision[jurisdiction].code 1..1 MS
* provision.provision[jurisdiction].code = http://fhir.ehealth-systems.at/fhir/ValueSet/data-use-categories#regulatory-jurisdiction "Regulatory jurisdiction"
* provision.provision[jurisdiction].class 0..0
* provision.provision[jurisdiction].purpose 0..0

* provision.provision[profitMotive].type 1..1 MS
* provision.provision[profitMotive].code 1..1 MS
* provision.provision[profitMotive].code = http://fhir.ehealth-systems.at/fhir/ValueSet/data-use-categories#PROFIT-MOTIVATED "Profit Motivated Use"
* provision.provision[profitMotive].class 0..0
* provision.provision[profitMotive].securityLabel 0..0
* provision.provision[profitMotive].purpose 0..0

* provision.provision[purpose].type 1..1 MS
* provision.provision[purpose].purpose 1..1 MS
* provision.provision[purpose].purpose = http://terminology.hl7.org/CodeSystem/v3-ActReason#HRESCH "healthcare research"
* provision.provision[purpose].class 0..0
* provision.provision[purpose].securityLabel 0..0
* provision.provision[purpose].code 0..0

