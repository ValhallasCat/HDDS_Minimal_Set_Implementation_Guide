
The background behind teh health data donation space comes from the [Samrt FOX Project](https://www.smart-fox.at/), active until end of June 2026.
The goal of Smart FOX is to increase the efficiency of clinical research through improved
secondary use of health data. Austria holds a significant competitive advantage here,
built on a decade of data harmonization efforts by Austria's national electronic health
record, ELGA (Elektronische Gesundheitsakte). Smart FOX aims to leverage this potential
and establish the framework for citizen-/patient-based donation of highly structured
ELGA datasets for clinical research.

However, before such a data donation can take place, the corresponding infrastructure
must first be established through the Austrian Data Donation Space. As part of this,
patients give their consent to donate data from their ELGA. These CDA-based data
donations are then transformed through several steps, resulting in a pseudonymized FHIR
Bundle that is sent to the FOX BOX. For this, a minimal FHIR Bundle must be defined,
this is necessary because it specifies the minimum data that must be present for a data
donation to be considered valid.