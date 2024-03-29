# Project name

If you are looking for instructions on how to use and install teft-base, please refer to the file [INSTALLATION.md](./INSTALLATION.md)

Short summary of the main functionality and purpose of the project.
 
## Made by
 
 List the people who have been extensively involved in creating this website
  
## How to build

List any steps necessary to get this project up and running on a local machine. This could consist of, but is not limited to, these points:

- NPM/yarn installation (please include a version of node on which the install process is known to work)
- SASS compilation
- JS compilation
- Composer quirks
- Symlinking

## Deployment
Specify how this project is deployed. For most projects, this should be simply "Through codeship".

## Custom wp-cli commands
List and document any custom-made wp-cli commands on this site.

## Third party integrations
List any third-party integrations which are included in the project. Each entry should include:

**Where in the project the integration is used**
What purpose the integration serves. Is it used when the user performs a special page query, or is it an import routine which runs at specific intervals?

**How the integration is configured**
Any constants be it PHP or Javascript that need to be set, and whether these constants are different on stage and production.

**Link to documentation**
Add a link to any relevant documentation, and specify which version of an API we use.

**Authorization**
Add some words about how the third-party server authenticates incoming requests and add any API-keys necessary. 

**Any terminal commands that could be useful**
Any custom made wp-cli commands which communicate with the third party, should be documented here. Also a link to any commands included in plugins which comunicate with the third-party, should be included.

## Cronjobs
List all non-standard cronjobs on the site and say a few words about the purpose of each of them.
