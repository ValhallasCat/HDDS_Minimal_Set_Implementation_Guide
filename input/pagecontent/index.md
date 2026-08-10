

The Health Data Donation Space (HDDS) aims to harness structured datasets from ELGA, the Austrian electronic health record, for research purposes through an opt-in approach. To achieve this, CDA-based ELGA documents are transformed into FHIR bundles, which are then forwarded as part of the data donation process. This IG defines a minimal profile set for the forwarded FHIR bundle, specifying the minimum information required for a data donation to be considered valid.

**Note:**TThis is the first draft of the IG. Further adjustments and specifications are planned to define the minimal requirements for further FHIR Resources which can be donated. This draft is based on the Austrian health system.

# HDDS Minimal Set Implementation Guide for Implementation of Data Donors

This FHIR Implementation Guide defines a minimal FHIR bundle with the required profiles. Each profile in the bundle also specifies a minimal data set required for a valid data donation.

## Background

The HDDS transforms CDA-based ELGA documents into FHIR bundles as part of an opt-in data donation process. This IG specifies the minimal profile set a forwarded FHIR bundle must satisfy in order to be accepted as a valid data donation by the Smart FOX infrastructure.

## Intended Audience

This guide is intended for developers implementing a data donation pipeline from a source system into the HDDS. Implementers must ensure the FHIR bundle they generate conforms to this minimal profile set.

## Resources and Dependencies

The following resources are affected:

- `Patient` — [HL7® AT Core Patient Profile R4](https://build.fhir.org/ig/HL7Austria/HL7-AT-FHIR-Core-R4/StructureDefinition-at-core-patient.html)
- `Condition` — [Condition profile R4](https://hl7.org/fhir/R4/condition.html)
- `Consent` — based on previous work by the Smart FOX project group ([Consent profile on Simplifier](https://simplifier.net/smartfox/consent/~json))

Also a `FHIR Bundle` will be created out of this three resources as a minimal FHIR bundle for data donation.

This IG is built on FHIR R4.

## How to Read This Guide

Familiarity with FHIR basics (resources, profiles, extensions) and [SHALL/SHOULD/MAY conformance language](http://hl7.org/fhir/conformance-rules.html) is assumed.

## License

This IG is published under the standard HL7 IG license (CC0).

---

Ultimately, this IG should enable the creation of a valid FHIR bundle that qualifies as a data donation within the Smart FOX infrastructure.