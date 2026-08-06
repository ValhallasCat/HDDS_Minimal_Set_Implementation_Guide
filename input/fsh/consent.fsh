// SmartFOX Consent profile. HL7 Austria's core R4 package does not define
// a Consent profile, so this builds directly on base FHIR R4 Consent.

Profile: SmartFOXConsent
Parent: Consent
Id: smartfox-consent
Title: "SmartFOX Consent"
Description: "Minimal Consent profile for the SmartFOX use case: records the patient's consent to share the accompanying Patient and Condition data."
* status 1..1 MS
* scope 1..1 MS
* category 1..* MS
* patient 1..1 MS
* patient only Reference(SmartFOXPatient)
* dateTime 1..1 MS
* extension contains SmartFOXConsentPurposeNote named consentPurposeNote 0..1 MS
* extension[consentPurposeNote] ^short = "Free-text note on the purpose of this consent"

// --- Custom information added for the SmartFOX use case ---

Extension: SmartFOXConsentPurposeNote
Id: smartfox-consent-purpose-note
Title: "Consent Purpose Note"
Description: "Free-text note describing the purpose for which the patient gave consent, for local reference within SmartFOX."
* value[x] only string
