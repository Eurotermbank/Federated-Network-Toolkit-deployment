# Terminology Data synchronization specification for Eurotermbank Federated Node

Version 0.2



# Description and Principles

Terminology managed by Eurotermbank.com is concept-oriented. Every term belongs to one certain terminology entry or concept. Concept can be monolingual, bilingual or multilingual. Terminoology concepts are grouped logically in terminology collections. Collections came from various sources, databases.

Eurotermbank.com central node will contain terminology data copies in the central database. All federated nodes stores their terminology collection a their federated database and regular data syngronization process will flush data changes from federated node to central node. This synhronization has only one direction.

Collections, that are managed by federated nodes, will be locked for eny editorial option at Central Eurotermbank system, only non-federated collection will have possibility to manage from central portal.

There are two subjects to synhronize – collection metadata and terminology data. Each collection must contain synchronization point and last update date to be able to synchronize updated data only.

## Data synchonization strategy

There is a Push data synhronization strategy enabled.

This strategy means that federated nodes manages by themselves synchronization point and data to be synchronized. Federated nodes regularly pushes their changes to the central node with their initiative. Central synchronization API (Central Sync API) is specified below in this document.


## Data Categories

Collection Metadata Categories will exist the same as central Eurotermbank node has.

See Terminology data Categories supported by eurotermbank.com in samples below. Here is TBX specification, more information about data categories can be found there: https://www.gala-global.org/sites/default/files/migrated-pages/docs/tbx_oscar_0.pdf

# Central Sync API

Central synchronization API implements Basic authentication. Each Federated node will have their own account - UserName and Password that must be added to every synchronization HTTP request.

Synchronization process is following:

1. Add New Collection Metadata. API will return an ID for the collection for further update needs.
2. Update existing Collection Metadata
3. Add new Concept entries or update existing
5. Delete removed entries
6. Delete removed collection including all entries

There are two ways how to deal with collections - you can PUT new collection and as the result retrieve it ID and use later the ID for updates and entries submittion. Or you can use methods that support your owd collection IDs and is called here as ExternalID.

You can use Postman (https://www.postman.com/) prepared collection [FEDTERM Synchro.postman_collection.json](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/3b70c207f94b0a01fc373776bbd29056216d5173/user-guides/FEDTERM%20Synchro.postman_collection.json "Postman collection") file.

<hr />

<u>Methods for using Eurotermbank Internal Collection IDs</u>
## Add New Collection Metadata
* Domain ID is mandatory and must be sent one of the IDs specified in [Domain Classifications](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/5918fe4486eac2f9f4067043b1cad9639d14a230/user-guides/DomainClassifiers.md)

POST /api/termsrv/sync/collection HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX

```json
{
    "name": "This is name of my collection",
    "description": "Description of my collection",   
    "domainid": "04",
    "allowsUsesBesidesDGT": true,
    "appropriatnessForDSI": true,
    "attributionText": "This is attribution text",
    "cpEmail": "Contac-person@example.com",
    "cpName": "Contac Person Name",
    "cpOrganization": "Contac Person Organization",
    "cpSurname": "Contac Person Surname",
    "iprEmail": "ipr-holder@example.com",
    "iprName": "IPR Holder name",
    "iprOrganization": "IPR Holder Organization",
    "iprSurname": "IPR Holder Surname",
    "isPSI": false,
    "licence": "CC-BY-4.0",
    "originalName": "Šis ir manas kolekcijas nosaukums",
    "originalNameLang": "LV",
    "restrictionsOfUse": "No restrictions, you are welcome to use",
    "sourceURL": "https://my-resource.example.com"
}
```
Return value: Id of created collection.


## Update Existing Collection Metadata

* Domain ID is mandatory and must be sent one of the IDs specified in [Domain Classifications](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/5918fe4486eac2f9f4067043b1cad9639d14a230/user-guides/DomainClassifiers.md)

PUT /api/termsrv/sync/collection HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX

```json
{
    "name": "This is updated name of my collection",
    "description": "Description of my collection",   
    "domainid": "04",
    "allowsUsesBesidesDGT": true,
    "appropriatnessForDSI": true,
    "attributionText": "This is attribution text",
    "cpEmail": "Contac-person@example.com",
    "cpName": "Contac Person Name",
    "cpOrganization": "Contac Person Organization",
    "cpSurname": "Contac Person Surname",
    "iprEmail": "ipr-holder@example.com",
    "iprName": "IPR Holder name",
    "iprOrganization": "IPR Holder Organization",
    "iprSurname": "IPR Holder Surname",
    "isPSI": false,
    "licence": "CC-BY-4.0",
    "originalName": "Šis ir manas kolekcijas nosaukums",
    "originalNameLang": "LV",
    "restrictionsOfUse": "No restrictions, you are welcome to use",
    "sourceURL": "https://my-resource.example.com"
}
```
Return value: Id of updated collection.

## Add New concept entry or Update Existing Concept Entries

*Multiple collection entries can be submitted, but only max 100 at single Post. Submited entries will be analyzed - if entry ID already exists, entry will be replaced with new version, otherwise new term entry will be created. In case there are no changes in posted entry - no action will be taken for that entry.*

POST /api/termsrv/sync/collection/{collection_id}/entries HTTP/1.1

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

Return value: As the result you will get summary of actions taken - You will see entry count that was inported including count of newly created and the count up updated antries, as well will get count of skippet entries - because beeing duplicates (exacly same entry exists in DB) or beeing corrupted (e.g. not having any terms).

Example of summary (tried to import 6 entries):
```json
{
    "totalImportedEntries": 4,
    "addedNewEntries": 1,
    "updatedEntries": 3,
    "skippedAsCorrupted": 0,
    "skippedAsDuplicates": 2
}
```
<hr />

<u>Methods for using External Collection ID</u>

## Delete Concept Entry

DELETE /api/termsrv/sync/collection/{collection_id}/entries/{entry_id} HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX


## Delete Collection

DELETE /api/termsrv/sync/collection/{collection_id}/
HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX





## Insert new Collection or Update Existing Collection Metadata using External Collection ID

* Domain ID is mandatory and must be sent one of the IDs specified in [Domain Classifications](https://github.com/Eurotermbank/Federated-Network-Toolkit-deployment/blob/5918fe4486eac2f9f4067043b1cad9639d14a230/user-guides/DomainClassifiers.md)

* In case external ID will exist for this federated node, metadata will be updated.

PUT /api/termsrv/sync/collection/external/{external-collection-id} HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX

```json
{
    "name": "This is name of my collection with External ID",
    "description": "Description of my collection",   
    "domainid": "04",
    "allowsUsesBesidesDGT": true,
    "appropriatnessForDSI": true,
    "attributionText": "This is attribution text",
    "cpEmail": "Contac-person@example.com",
    "cpName": "Contac Person Name",
    "cpOrganization": "Contac Person Organization",
    "cpSurname": "Contac Person Surname",
    "iprEmail": "ipr-holder@example.com",
    "iprName": "IPR Holder name",
    "iprOrganization": "IPR Holder Organization",
    "iprSurname": "IPR Holder Surname",
    "isPSI": false,
    "licence": "CC-BY-4.0",
    "originalName": "Šis ir manas kolekcijas nosaukums",
    "originalNameLang": "LV",
    "restrictionsOfUse": "No restrictions, you are welcome to use",
    "sourceURL": "https://my-resource.example.com"
}
```
Return value: Id of updated collection.

## Add New concept entry or Update Existing Concept Entries using External Collection ID

*Multiple collection entries can be submitted, but only max 100 at single Post. Submited entries will be analyzed - if entry ID already exists, entry will be replaced with new version, otherwise new term entry will be created. In case there are no changes in posted entry - no action will be taken for that entry.*

POST /termsrv/sync/collection/external/{my-collection-id}/entries HTTP/1.1

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

Return value: As the result you will get summary of actions taken - You will see entry count that was inported including count of newly created and the count up updated antries, as well will get count of skippet entries - because beeing duplicates (exacly same entry exists in DB) or beeing corrupted (e.g. not having any terms).

Example of summary (tried to import 6 entries):
```json
{
    "totalImportedEntries": 4,
    "addedNewEntries": 1,
    "updatedEntries": 3,
    "skippedAsCorrupted": 0,
    "skippedAsDuplicates": 2
}
```

## Delete Concept Entry using External Collection ID

DELETE /api/termsrv/sync/collection/external/{external-collection-id}/entries/{entry_id} HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX


## Delete Collection using External Collection ID

DELETE /api/termsrv/sync/collection/external/{external-collection-id}/
HTTP/1.1

Host: eurotermbank.com

Content-Type: application/json

Authorization: Basic XXXXXXXXXXXX