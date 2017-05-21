% Arvore de deicsao

a = importdata('abalone.data'); % carrega arquivo

variavel = 2784

% treinamento...
Mdl = fitctree(a.data((1:variavel),(1:8)),a.textdata((1:variavel),1));  

% reconhecimento... 2785 ate 4177
aux = a.data(((variavel+1):4177),(1:8));
Ynew = predict(Mdl,aux); 

cont = 0; total = 0;

for i=1:1:(4177-variavel)
    
    flag = strcmp( Ynew(i) , a.textdata(i+variavel) );
    
    if( flag == 1)
        cont = cont + 1;
    end
    total = total + 1;
end

taxa_de_reconhecimento = cont/total  % taxa de reconhecimento
