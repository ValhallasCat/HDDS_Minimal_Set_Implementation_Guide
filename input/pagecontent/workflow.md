# Workflow

The typical data donation workflow using this Implementation Guide looks like this:

1. **Capture consent.** The patient's agreement to donate their data is recorded as a
   [SmartFOXConsent](StructureDefinition-smartfox-consent.html) resource.
2. **Collect patient demographics.** The patient's core identifying and demographic data is
   captured as a [SmartFOXPatient](StructureDefinition-smartfox-patient.html) resource.
3. **Collect condition data.** Every relevant health condition is captured as one
   [SmartFOXCondition](StructureDefinition-smartfox-condition.html) resource, each referencing the
   patient.
4. **Assemble the minimal set.** The Patient, Consent, and all Condition resources are packaged
   together into a single [SmartFOXMinimalSetBundle](StructureDefinition-smartfox-minimal-set-bundle.html)
   — a `collection`-type Bundle that requires exactly one Patient, exactly one Consent, and one or
   more Condition entries.
5. **Forward to the FOX BOX.** The assembled Bundle is sent as one unit into the FOX BOX for
   further data donation processing.

Because the Bundle profile constrains which resources may appear and how many of each are
required, a receiving system can validate an incoming Bundle against
[SmartFOXMinimalSetBundle](StructureDefinition-smartfox-minimal-set-bundle.html) and reject it
immediately if, for example, the consent is missing.

See the [example Bundle](Bundle-SmartFOXMinimalSetBundleExample.html) for a complete instance of
this workflow's output.

test
