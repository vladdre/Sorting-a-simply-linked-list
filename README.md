Definesc mai intai structura nod ce are campurile val si next de 4 bytes fiecare (toata
structura avand 8 bytes).
    Am facut mai intai o implementare in C a functiei sort apoi am tradus o in asm instructiune
cu instructiune. Se creeaza o stiva si se goleste eax cu un xor, apoi se pune in ecx pe n (primul
parametru al functiei sort) si in ebx un pointer la inceputul vectorului de noduri (al doilea
parametru). Initializam cu 0 si pe esi (= va fi valoarea pe care o cautam), edi (= va retine
capul listei sortate si legate) si pe eax (= ultimul nod pe care l am legat).
    In eticheta for_i, il incrementam pe esi (valoarea cautata va coincide cu i) si facem 0
pe edx (= va fi j ul nostru).
    In eticheta for_j, punem in ecx valoarea nodului de la indexul j, iar daca aceasta e egala
cu i, vom sari la gasit deoarece am gasit valoarea cautata. Adunam la edx (= j) pe 8 (dimensiunea
unuie structuri node) pentru a trece la valoarea urmatorului nod si sarim inapoi in for_j.
    In eticheta gasit, punem in ecx adresa nodului gasit, iar daca esi (= i) nu e egal cu 1,
adica nu e primul nod din lista sortata (elementele sunt de la 1 la n) sarim in ultimul_legat.
Daca totusi e primul nod, punem in edi (= capul listei sortate) pe ecx (= adresa nodului gasit)
si sarim in salvam_ultimul_nod.
    In eticheta ultimul_legat, punem in adresa next ului ultimului nod legat pe noul nod gasit.
    In eticheta salvam_ultimul_nod, punem in eax pe ecx (actualizand ultimul nod legat), punem
in ecx vechea lui valoare de la inceput (adica n) si il comparam pe esi (= i) cu ecx (= n).
Daca i < n, sarim in for_i.
    In eticheta gata, punem in eax pe edi (capul listei sortate) si dam leave si ret.
