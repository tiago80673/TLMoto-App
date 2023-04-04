function lapTime = lapSeparate (gps,meta)

lapTime =  [];
%   Exemplo: Ficheiro 'Primeira_Saida.txt' ---> Kartodromo de Kiro 
%   Meta - > 39.26642438391545, -9.188870809998459
%             39.26641140518718, -9.188762851087874

%   meta = [-9.188870809998459,-9.188762851087874 ; 39.26642438391545, 39.26641140518718 ];
%  2 : meta = [-9.188945,-9.188682;39.266435,39.266407]
    for ii = 1:(length(gps)-1)
    
         gpsLine = [gps(ii,2),gps(ii+1,2);gps(ii,1),gps(ii+1,1)];
    
        if ~isempty(InterX(gpsLine,meta))

            lapTime(end+1) = gps(ii+1,4); %  Este valor corresponde ao tempo da primeira 
                                          %  coordenada da nova volta, logo a volta vai 
                                          %  deste valor até a primeira coordenada da volta seguinte -1     
        end
    end 
% A função retorna um vector com a primeira coordenada de cada nova volta
end