# Hypatia Databases
This repository contains the database files, the generation scripts and the web server for the malware databases used in the FOSS android antivirus [Hypatia](https://github.com/MaintainTeam/Hypatia).
## Structure
This is a manual mirror and backup generator of https://codeberg.org/MaintainTeam/HypatiaDatabases which generates the default databases.

This repo has several branches. The `main` branch contains the [code](.github/workflows/generate_stable.yml) used to generate the databases. The `unsigned` branch contains the generated databases, before they are signed. From here, this branch is checked out by a self-hosted CI and signed with our key, and pushed to the `gh-pages` branch where it is deployed.
## Databases
### General Sources
- [ESET Indicators of Compromise (IOC's)](https://github.com/eset/malware-ioc)
- [ThreatView Malware Databases](https://threatview.io/)
- [ThreatFox](threatfox.abuse.ch)
- [Malware Bazzar](https://bazaar.abuse.ch/)
- [CyberCure](https://www.cybercure.ai/)
- [SaneSecurity](https://sanesecurity.com/)
- [Signature Base](https://github.com/Neo23x0/signature-base)
### Specific Sources
- [Stalkerware IOCs](https://github.com/AssoEchap/stalkerware-indicators)
- [Covid-19 IOCs](https://github.com/avast/covid-19-ioc)
### Domain Sources
- Divested Computing Group's [Domain Blocklists](https://divested.dev/pages/dnsbl)
## Generation
The databases are generated on GitHub's and Codeberg's CI. We utilize a fork of Divest Mobile's [database generator](./src/main/java/org/maintainteam/hypatiadatabases/App.java) to sort the database files, aggregate the hashes, and then create Bloom Filters from them. Then, GitHub/Codeberg Pages are used to publish the files online.
## Contribution
**Development work is done on GitHub, Codeberg is only a mirror.**

We are always looking for new sources to add to our databases, so if you come across one that you believe could work, please either create an issue with the link to the source, and it's copyright, or if you can, submit a pull request to add it to the GitHub actions file. 

If adding a new source, the general proccess is:
1. Download the source to the `/various/vendor` directory.
2. Proccess the file(s) to extract the hashes, and if applicable the malware description.
3. Combine the name and hash (`hash:0:name/description`) and add them to a file with the appropriate extension.
4. Move the resulting file to the `/raw/vendor` directory.
