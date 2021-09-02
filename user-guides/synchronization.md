# Terminology Data synchronization specification for Eurotermbank Federated Node

Version 0.1

## Draft

_Data model, examples and all other information are not yet stable and can be subject to change_

# Description and Principles

Terminology managed by Eurotermbank.com is concept-oriented. Every term belongs to one certain terminology entry or concept. Concept can be monolingual, bilingual or multilingual. Terminoology concepts are grouped logically in terminology collections. Collections came from various sources, databases.

Eurotermbank.com central node will contain terminology data copies in the central database. All federated nodes stores their terminology collection a their federated database and regular data syngronization process will flush data changes from federated node to central node. This synhronization has only one direction.

Collections, that are managed by federated nodes, will be locked for eny editorial option at Central Eurotermbank system, only non-federated collection will have possibility to manage from central portal.

There are two subjects to synhronize – Collection Metadata and terminology data. Each collection must contain synchronization point and last update date to be able to synchronize updated data only.

Data synchonization strategies

There are two data synhronization strategies enabled – Push and Pull strategie.

![image](https://user-images.githubusercontent.com/11315268/131524132-266421fb-049c-4e0e-823b-85e2d89adec9.png)

_Figure 1 Data synchronization strategies_

Pull strategy means that federated nodes manages by themselves synchronization point and data to be synchronized. Federated nodes regularly pushes their changes to the central node with their initiative. Central synchronization API (Central Sync API) is specified later in this document.

Eurotermbank.com central node will contain synchronization time for each federated collection. Pull strategy will be established by having an agent – SyncJob, that will ask Federated node for data changes after the synchronization point. And this agent after getting changes from federated node will continue Push strategy workflow – will exploit same data synchronization endpoint. In this scenario federated node do not have to create integration with Central Sync API, but must ensure node synchronization API (Node Sync API).

Data Categories

Collection Metadata Categories will exist the same as central Eurotermbank node has.

Terminology data Categories supported by eurotermbank.com is here.

# Central Sync API

Central synchronization API implements Basic authentication. Each Federated node will have their own account - UserName and Password that must be added to every synchronization HTTP request.

Synchronization process is following:

1. Add New Collection Metadata. API will return an ID for the collection for further update needs.
2. Update existing Collection Metadata
3. Add new Concept entries or update existing
5. Delete removed entries

## Add New Collection Metadata

POST /termsrv/sync/collection HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Bearer XXXXXXXXXXXX

```json
{
    "name": "This is name of my collection",
    "description": "Description of my collection",
    "externalUri": "",
    "domainid": "0202",
    "allowsUsesBesidesDGT": true,
    "appropriatnessForDSI": true,
    "attributionText": null,
    "cpEmail": null,
    "cpName": null,
    "cpOrganization": null,
    "cpSurname": null,
    "iprEmail": null,
    "iprName": null,
    "iprOrganization": null,
    "iprSurname": null,
    "isPSI": null,
    "licence": null,
    "originalName": null,
    "originalNameLang": null,
    "restrictionsOfUse": null,
    "sourceURL": null
}
```

## Update Existing Collection Metadata

TODO

## Add New concept entries

TODO

## Update Existing Concept Entry

TODO

## Delete Concept Entry

TODO
