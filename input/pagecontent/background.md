# Background

The SmartFOX data donation process requires a minimal, well-defined set of clinical
information about a patient before it can be forwarded into the FOX BOX. Sending full,
unconstrained FHIR resources is unnecessary for this use case and makes it harder for
downstream systems to know what data to expect.

This Implementation Guide defines that minimal set:

* A **Patient** ([SmartFOXPatient](StructureDefinition-smartfox-patient.html)), built on top of
  [HL7 Austria's AT Core Patient profile](http://hl7.at/fhir/HL7ATCoreProfiles/4.0.1/StructureDefinition/at-core-patient)
  so that demographic data stays aligned with the Austrian national base profiles.
* One or more **Condition** resources ([SmartFOXCondition](StructureDefinition-smartfox-condition.html))
  describing the health condition(s) relevant to the donation.
* A **Consent** resource ([SmartFOXConsent](StructureDefinition-smartfox-consent.html)) recording
  that the patient has agreed to share this data.

Building on HL7 Austria's core profiles where they exist (Patient) means implementers already
familiar with the Austrian FHIR ecosystem can reuse existing tooling and validation. Where no
Austrian core profile exists yet (Condition, Consent), the profiles constrain base FHIR R4
directly.

Each profile adds a small amount of SmartFOX-specific information on top of its base — for
example, a patient's preferred contact method, a free-text triage priority note on a condition,
and a free-text purpose note on the consent — so the FOX BOX receives everything it needs without
requiring a separate, non-standard data format.
