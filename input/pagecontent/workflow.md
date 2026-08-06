The typical data donation workflow using this Implementation Guide looks like this:

1. **Capture consent.** The patient's agreement to donate their data is recorded as a
   [SmartFOXConsent](StructureDefinition-smartfox-consent.html) resource.

2. **CDA document transformation.** The CDA-based ELGA document is embedded in a FHIR
   Bundle and transferred to the [Safeguard](https://smartfox-project.github.io/Safeguard-API/index.html).

3. **CDA pseudonymization and transformation.** The CDA document is pseudonymized by
   [MaLaC-HD](https://gitlab.com/cdehealth/malac-hd) and split into FHIR resources. The
   minimal required resources are defined in this IG.

4. **Creation of a FHIR Bundle for data donation.** These FHIR resources, stemming from
   the pseudonymized CDA, are accumulated into a FHIR Bundle (the minimal bundle is
   defined in this IG).

5. **Forwarding of the FHIR Bundle.** This Bundle is then forwarded to the
   [FOX BOX](http://journals.sagepub.com/doi/pdf/10.3233/SHTI324#page=213) for further
   data donation processing.

Because the Bundle profile constrains which resources are required for a valid data
donation, a receiving system can validate an incoming Bundle against
[SmartFOXMinimalSetBundle](StructureDefinition-smartfox-minimal-set-bundle.html) and
reject it immediately if, for example, the consent is missing.

See the [example Bundle](Bundle-SmartFOXMinimalSetBundleExample.html) for a complete
instance of this workflow's output.
