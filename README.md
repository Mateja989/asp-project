**# Dokumentacija**

## Tema projekta
API projekat JobFinder je zamisljen kao platforma,za oglasavanje poslova,razlicitih kategorija kao i medjusobnu komunikaciju kandidata i poslodavaca.<br />                         
Za sada fokus nije bio na CRUD operacijama vec na pisanju sto manje repetativnog koda,kao i koriscenje generickih tipova.<br />
Tako da su **Command** / e potpuno pokrivene genericki i skoro da nema repetativnog koda,dok **Query** sem paginacije jos nije.<br />
Plan je da se za diplomski za Query koristi NoSQL baza kao sto je ElasticSearch<br />

***

_**Kredencijali**_<br />
_Admin_
Email : admin@gmail.com
Password : NekaLoznika<br />
_Candidate_
Email : candidate@gmail.com
Password : CandidatePassword123<br />
_Employer_
Email : employer@gmail.com
Password : EmployerPassword456<br />
### Funkcionalnosti projekta
* Kreiranje profila za kandidate i poslodavce <br />
* Izmena profila za kandidate i poslodavnce <br />
* Insert fajla za kandidata,tacnije CV u .pdf formatu,prilikom kreiranja profila <br />
* Citanje,Izmena,Brisanje Skillova <br />
* Citanje,Brisanje Kategorija <br />
* Citanje i pretraga AuditLoga <br />
* Poslodavac kreira posao,kao i oglase za posao <br />
* Citanje poslova,kao i oglasa za posao <br />
* Apliciranje na aktivne oglase za posao <br />
* Citanje i pretraga korisnika <br />
### Sema baze podataka
Baza podataka sadrzi sve tipove relacija,takodje koristi TPH pristup za Users tabelu <br/>

[[https://github.com/Mateja989/asp-project/blob/main/baza.png]]
