function gpsData= gpsProces(data)

    gpsData_aux = data{strcmp(data{:,1},'$GPGGA'),[3 4 5 6 7 14 16]};
    
    %data->gpsData_aux
    % 3  ->   1   latitude [DDMM.MMMMMM]
    % 4  ->   2   direction of latitude ['N','S']
    % 5  ->   3   longitude [DDDMM.MMMMMM]
    % 6  ->   4   direction of longitude ['E','W']
    % 7  ->   5   '$GPVTG' - Será usado para identificar falha em dados
    %14  ->   6   Ground speed [Km/h]
    %16  ->   7   Time[s*1000]

    %Remove linhas que contenham celulas <missing>
    gpsData_aux = rmmissing(gpsData_aux); 
    
    %Remove linhas que contenham celulas em branco
    gpsData_aux=gpsData_aux(~logical(sum(cellfun('isempty',gpsData_aux)')'),:);

    %Remove a linha cujo 3 elemento não tem identificação de orientação (N,S,L,W) 
    %correta e transforma a latitude e longitude em um sistema que admite valores
    %negativos e positivos 
    
    jj = []; % Auxiliar necessário para remover linhas fora do padrão
    for ii = 1:length(gpsData_aux)
            
        %O caracter 1 adicionado no incio das coordenadas serve para
        %conservar o zero em entradas cujo valor inicial é 0
        gpsData_aux(ii,1) = append('1',gpsData_aux(ii,1));
        gpsData_aux(ii,3) = append('1',gpsData_aux(ii,3));

         if ~( strcmp(gpsData_aux(ii,2),'N') || strcmp(gpsData_aux(ii,2),'S')...
                 ||strcmp(gpsData_aux(ii,4),'W')||strcmp(gpsData_aux(ii,4),'L'))
           %Apenas marcaremos com a variavel jj quais as linhas
           %problemáticas, pois se retirarmos uma linha neste momento o
           %vector vai ter um menor numero e o ciclo vai tentar rodar até
           %um elemento inexistente do gpsData_aux

           jj(end+1) = ii;
            
         elseif strcmp(gpsData_aux(ii,2),'S')
             gpsData_aux(ii,1) = append('-',gpsData_aux(ii,1));
         elseif strcmp(gpsData_aux(ii,4),'W')
             gpsData_aux(ii,3) = append('-',gpsData_aux(ii,3));
         end
    end
    
    gpsData_aux(jj,:) = [];

        
    %gpsData formato
    % coluna
    %  1    -> latitude [1DDMM.MMMMMM] with signal
    %  2    -> longitude [1DDDMM.MMMMMM] with signal
    %  3    -> Ground Speed [km/h]
    %  5    -> time [1000*s]
 
    gpsData = gpsData_aux(:,[1 3 6 7]);
    gpsData = cellfun(@str2doubleq,gpsData);

    %Remove as longitude e latitudes com valor zero
     gpsData(abs(gpsData(:,1)) == 10,:)= [];
     gpsData(abs(gpsData(:,2)) == 10,:)= [];
end

