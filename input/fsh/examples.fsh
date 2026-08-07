Instance: SmartFOXPatientExample
InstanceOf: SmartFOXPatient
Usage: #example
Title: "SmartFOX Patient Example"
* identifier.system = "http://example.org/fhir/identifier/patient-id"
* identifier.value = "AT-Pat_SmartFOX-123"
* gender = #female
* birthDate = "1980-01-01"
* telecom[contactUrl].system = #url
* telecom[contactUrl].value = "https://smartfox.example.org/contact/maria-muster"

Instance: MinimalConditionExample
InstanceOf: MinimalCondition
Usage: #example
Title: "SmartFOX Condition Example"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* code = $icd10-bmg#G93.3 "Chronisches Müdigkeitssyndrom"
* subject = Reference(SmartFOXPatientExample)
* onsetDateTime = "2025-09-01"
* recordedDate = "2026-03-01"


Instance: HDDSConsentExample
InstanceOf: HDDSConsent
Usage: #example
Title: "Consent Example"
* status = #active
* dateTime = "2026-03-15T15:25:00Z"
* patient = Reference(SmartFOXPatientExample)
* sourceAttachment.url = "https://doi.org/10.1038/s41597-024-03280-6"
* sourceAttachment.title = "Jeanson, F., Gibson, S.J., Alper, P. et al. Getting your DUCs in a row - standardising the representation of Digital Use Conditions. Sci Data 11, 464 (2024)."
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTINR
* provision.type = #deny
* provision.period.start = "2025-03-19"
* provision.period.end = "2026-03-19"
* provision.provision[diagnosisExclusion].type = #permit
* provision.provision[diagnosisExclusion].class = http://terminology.hl7.org/NamingSystem/icd10#E11 "Type 2 diabetes mellitus"
* provision.provision[diagnosisExclusion].code = http://fhir.ehealth-systems.at/fhir/ValueSet/data-use-categories#disease-specific-use
* provision.provision[jurisdiction].type = #permit
* provision.provision[jurisdiction].securityLabel = urn:iso:std:iso:3166:1:alpha-2#EU "European Union"
* provision.provision[profitMotive].type = #deny
* provision.provision[profitMotive].code = http://fhir.ehealth-systems.at/fhir/ValueSet/data-use-categories#PROFIT-MOTIVATED "Profit Motivated Use"
* provision.provision[purpose].type = #permit
* provision.provision[purpose].purpose = http://terminology.hl7.org/CodeSystem/v3-ActReason#HRESCH "healthcare research"


Instance: SmartFOXMinimalSetBundleExample
InstanceOf: SmartFOXMinimalSetBundle
Usage: #example
Title: "SmartFOX Minimal Set Bundle Example"
* type = #collection
* entry[patient].fullUrl = "http://example.org/fhir/Patient/SmartFOXPatientExample"
* entry[patient].resource = SmartFOXPatientExample
* entry[condition][0].fullUrl = "http://example.org/fhir/Condition/MinimalConditionExample"
* entry[condition][0].resource = MinimalConditionExample
* entry[consent].fullUrl = "http://example.org/fhir/Consent/HDDSConsentExample"
* entry[consent].resource = HDDSConsentExample
