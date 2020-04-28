# Curs B--Ex4aze de Date


**SQL** este un **limbaj orientat pe seturi** (set-oriented language);

Limbajul SQL are următoarele comenzi, grupate în 4 categorii:

Data Manipulation Language (DML): `SELECT, INSERT, UPDATE, DELETE, MERGE`
Data Definition Language (DDL): `CREATE, ALTER, DROP, RENAME, TRUNCATE, COMMENT`
Data Control Language (DCL): `GRANT, REVOKE`
Transaction Control Language (TCL): `COMMIT, ROLLBACK, SAVEPOINT`

Comenzile DML

SELECT – folosită pentru a extragerea datelor din baza de date
INSERT – folosită pentru inserarea datelor în baza de date
UPDATE – folosită pentru modificarea datelor din baza de date
DELETE – folosită pentru ștergerea înregistrărilor
Comenzile DDL

CREATE – folosită pentru crearea unui obiect (tabel, view, index, etc.) în baza de date
ALTER – folosită prentru modificarea structurii unui obiect din baza de date
DROP – folosită prentru ștergerea unui obiect din baza de date
Comenzile DCL

GRANT – folosită prentru a grantifica drepturi de acces la un obiect din baza de date
REVOKE – folosită pentru a revoca drepturile de acces


##### Proiecția (π)
* operația care afișează selectiv anumite coloane din una sau mai multe tabele (submulțime verticală);

##### Selecția sau restricția (σ)
* operație care preia și afișează toate liniile, din una sau mai multe tabele, sau numai liniile care îndeplinesc una sau mai multe condiții(submulțime orizontală);

##### Produsul (x)
* rezultatul obținut prin concatenarea liniilor a două mulțimi de date conform condițiilor specificate;

##### Reniunea (U)
* rezultatul obținut prin afișarea liniilor comune și neconume dintre două sau mai multe tabele;

##### Intersecția (∩)
* rezultatul obținut prin afișarea liniilor comune dintre două sau mai multe tabele.

##### Diferența (-)
* rezultatul obținut prin afișarea liniilor care aparțin numai unei singure tabele conform condițiilor specificate;

##### Joinul sau compunerea (⋈)
* rezultatul obținut prin concatenarea coloanelor din una sau mai multe tabele conform condițiilor specificare;

##### Compunere naturală (natural join ⋈)
* combină liniile din două relaţii, cu condiţia ca atributele comune să aibă valori identice;

##### Semi-compunere (semi-join ⋉ ⋊)
* selectează liniile ce aparţin unei singure relaţii, care sunt corelate cu liniile din cea de a doua relaţie;

##### Θ-compunere (Θ-join)
* combină liniile din două relaţii (nu neaparat corelate), cu condiţia ca valorile atributelor specificate să satisfacă o anumită condiţie;

##### Compunere externă (outer join)
* combină liniile din două tabele, astfel încât condiţiile de corelare să fie satisfăcute. Liniile din orice relaţie care nu satisfac aceste condiţii sunt completate cu valori null.

### Constrângeri
* proprietăți ale unei coloane ce trebuie să fie îndeplinite în orice moment

**NOT NULL** – valoarea coloanei nu trebuie să fie NULL

**UNIQUE** – valoarea coloanei trebuie să fie unice

**PRIMARY KEY** – valoarea unei coloane (combinarea de valori ale unor coloane) trebuie să fie unice pentru fiecare linie din tabelă și să nu fie NULL. Cheia primară este identificatorul unic al unei înregistrări dintr-o tabelă

**FOREIGN KEY** – valoarea unei coloane (combinatia de valori ale unor coloane) fac legătura cu alta tabela prin referirea cheii primare/unice din acea tabela