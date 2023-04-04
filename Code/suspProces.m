function suspData = suspDataProces(data)

    suspData = data{strcmp(data{:,1},'susp'),2:4}; %A primeira coluna de data é do tipo text
    suspData = cellfun(@str2doubleq,suspData);        %Passamos a ter os dados salvos em double

    %Pequena computação feita só para possibilitar a Organização das Voltar
%     !!!!!!!!!!!!!!!! CONFERIR DIVISÃP POR 1000

    suspData(:,3) = suspData(:,3)/1000;
end