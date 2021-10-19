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

You can use Postman (https://www.postman.com/) prepared collection [FEDTERM Synchro.postman_collection.json](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/3b70c207f94b0a01fc373776bbd29056216d5173/user-guides/FEDTERM%20Synchro.postman_collection.json "Postman collection") file.

## Add New Collection Metadata

POST /termsrv/sync/collection HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX

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

PUT /termsrv/sync/collection HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX

```json
{
    "id": 112233,
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

## Add New concept entry or Update Existing Concept Entries

*Multiple collection entries can be submitted, but only max 100 at single Post. Submited entries will be analyzed - if entry ID already exists, entry will be replaced with new version, otherwise new term entry will be created. In case there are no changes in posted entry - no action will be taken for that entry.*

POST /termsrv/sync/collection/{collection_id}/entries HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX

```xml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE martif SYSTEM "https://eurotermbank.com/TBXcoreStructV02%20%281%29.dtd">
<martif type="TBX" xml:lang="en">
  <martifHeader>
    <fileDesc>
      <sourceDesc>
        <p>Sync collection sample</p>
      </sourceDesc>
    </fileDesc>
    <encodingDesc>
      <p type="XCSURI">https://eurotermbank.com/tbx-0.5.1.xcs</p>
    </encodingDesc>
  </martifHeader>
  <text>
    <body>
<termEntry id="external-id-369">
  <langSet xml:lang="en">
    <ntig>
      <termGrp>
        <term>Computer</term>
      </termGrp>
      <termNote type="administrativeStatus">preferredTerm-admn-sts</termNote>
      <admin type="status">approved</admin>
      <termNote type="normativeAuthorization">approved</termNote>
      <termNote type="grammaticalGender">masculine</termNote>
      <termNote type="grammaticalNumber">singular</termNote>
      <termNote type="partOfSpeech">noun</termNote>
      <termNote type="register">technicalRegister</termNote>
      <termNote type="termType">entryTerm</termNote>
      <termNote type="usageNote">Commonly used</termNote>
      <note>Use without restriction</note>
      <xref type="xSource" target="our company rules" />
      <descripGrp>
        <descrip type="context">Early computers were meant to be used only for calculations</descrip>
        <admin type="sourceIdentifier">https://en.wikipedia.org/wiki/Computer</admin>
      </descripGrp>
    </ntig>
    <descripGrp>
      <descrip type="definition">A computer is a machine that can be programmed to carry out sequences of arithmetic or logical operations automatically.</descrip>
      <admin type="sourceIdentifier">https://en.wikipedia.org/wiki/Computer</admin>
    </descripGrp>
  </langSet>
  <langSet xml:lang="lv">
    <ntig>
      <termGrp>
        <term>Dators</term>
      </termGrp>
      <admin type="status">approved</admin>
    </ntig>
    <ntig>
      <termGrp>
        <term>Kompjūters</term>
      </termGrp>
      <admin type="status">approved</admin>
      <termNote type="temporalQualifier">obsoleteTerm</termNote>
      <note>Dažkārt tiek lietots automotive un citās inženierzinātnēs</note>
    </ntig>
  </langSet>
  <descrip type="subjectField">Politics and Administration</descrip>
</termEntry>
<termEntry id="external-id-370">
  <langSet xml:lang="en">
    <ntig>
      <termGrp>
        <term>Computer program</term>
      </termGrp>
      <admin type="status">approved</admin>
    </ntig>
    <descripGrp>
      <descrip type="definition">A computer program is a collection of instructions[1] that can be executed by a computer to perform a specific task.</descrip>
    </descripGrp>
  </langSet>
  <langSet xml:lang="lv">
    <ntig>
      <termGrp>
        <term>Datorprogramma</term>
      </termGrp>
      <admin type="status">approved</admin>
    </ntig>
  </langSet>
  <descrip type="subjectField">Politics and Administration</descrip>
</termEntry></body>
  </text>
</martif>
```

## Delete Concept Entry

DELETE /termsrv/sync/collection/{collection_id}/entries/{entry_id} HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX

# Node sync API (for Pull strategy)
Methods to be specified


