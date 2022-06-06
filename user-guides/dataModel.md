#Supported data categories

|                                  | cardinality             | Excell export       | UI label                   | Export column name   | TBX 3 Category                             | TBX 2 category                           |
| -------------------------------- | ----------------------- | ------------------- | -------------------------- | -------------------- | ------------------------------------------ | ---------------------------------------- |
| Concept (Entry)                  |                         |                     |                            | /conceptEntry        | /termEntry                                 |
|     Domain                       | inherit from Collection |                     |                            |                      |  descrip\[@type='subjectField'\]           |  descrip\[@type='subjectField'\]         |
|     Language Object              | 1..N                    |                     |                            |                      | langSec                                    | langSet                                  |
|        ISO Lang label            | 1                       |                     |                            |                      | '@xml:lang                                 | @xml:lang                                |
|        Definition                | 0-N                     | \-                  | Definition                 | descripGrp           | descripGrp                                 |
|            Text                  | 1                       | y                   | Text                       | Definition           |      descrip\[@type='definition'\]         |      descrip\[@type='definition'\]       |
|            Reference             | 0..1                    | n                   | Source                     | DefinitionSource     |      admin\[@type='source'\]               |      admin\[@type='sourceIdentifier'\]   |
|        Media - Image             | 0..1                    | \-                  |                            |                      | xref\[@type='xGrafic'\]                    | xref\[@type='xGrafic'\]                  |
|            Label                 | n                       |                     | ImageLabel                 |     text()           |     text()                                 |
|            Url                   |                         | n                   |                            | ImageUrl             |    @target                                 |    @target                               |
|        Media - Video             | 0..1                    | \-                  |                            |                      |                                            | xref\[@type='xVideo'\]                   |
|            Label                 | n                       |                     | VideoLabel                 |     text()           |
|            Url                   |                         | n                   |                            | VideoUrl             |                                            |    @target                               |
|         Term Object              | 1..N                    |                     |                            |                      |                                            |                                          |
|            Text                  | 1                       | y                   |                            |                      | termSec/term                               | ntig/termGrp/term                        |
|            Approved/Draft        | 0..1                    | only approved terms | Approved or Draft          | \-                   |                                            | admin\[@type='status'\]                  |
|            Example               | 0..1                    | \-                  | Context examples           | descripGrp           | descripGrp                                 |
|                Text              | 1                       | y                   | Example                    | Context              |       descrip\[@type='context'\]           |       descrip\[@type='context'\]         |
|                Source            | 0..1                    | n                   | Source                     | ContextSource        |       admin\[@type='source'\]              |       admin\[@type='sourceIdentifier'\]  |
|            Gr. gender            | 0..1                    | y                   | Grammatical gender         | GrammaticalGender    | termNote\[@type='grammaticalGender'\]      |
|            Gr. number            | 0..1                    | y                   | Grammatical number         | GrammaticalNumber    | termNote\[@type='grammaticalNumber'\]      | termNote\[@type='grammaticalNumber'\]    |
|            Gr. POS               | 0..1                    | y                   | Grammatical part of speech | GrammaticalPOS       | termNote\[@type='partOfSpeech'\]           | termNote\[@type='partOfSpeech'\]         |
|            Term type             | 0..1                    | y                   | Term type                  | TermType             | termNote\[@type='termType'\]               | termNote\[@type='termType'\]             |
|            Administrative status | 0..1                    | y                   | Administrative status      | AdministrativeStatus | termNote\[@type='administrativeStatus'\]   | termNote\[@type='administrativeStatus'\] |
|            Approval status       | 0..1                    | y                   | Approval status            | ApprovalStatus       | termNote\[@type='normativeAuthorization'\] |
|            Temporal qualifier    | 0..1                    | y                   | Temporal qualifier         | TemporalQualifier    | termNote\[@type='temporalQualifier'\]      |
|            Register              | 0..1                    | y                   | Register                   | Register             | termNote\[@type='register'\]               | termNote\[@type='register'\]             |
|            Usage note            | 0..1                    | y                   | Usage note                 | UsageNote            | termNote\[@type='usageNote'\]              |
|            Source (link)         | 0..1                    | y                   | Source (link)              | Source               |                                            | xref\[@type='xSource'\]/@target          |
|            Note                  | 0..1                    | y                   | Note                       | Note                 | note                                       | note                                     |
