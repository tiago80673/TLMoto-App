function controller = controllerProces(data)

    % Dados do controlador com código 11
    controller.n1 = data{strcmp(data{:,1},'11'),2:6};
    controller.n1 = cellfun(@str2doubleq,controller.n1);
    
    % Dados do controlador com código 12
    controller.n2 = data{strcmp(data{:,1},'12'),2:6};
    controller.n2 = cellfun(@str2doubleq,controller.n2);

    % Dados do controlador com código 13
    controller.n3 = data{strcmp(data{:,1},'13'),2:6};
    controller.n3 = cellfun(@str2doubleq,controller.n3);

    % Dados do controlador com código 14
    controller.n4 = data{strcmp(data{:,1},'14'),2:6};
    controller.n4 = cellfun(@str2doubleq,controller.n4);

    % Dados do controlador com código 15
    %O rpm (coluna 2 e 3) tem 32 bits, como os 16 bits menos significativos
    %são o suficiente para realizar as medições necessária vamos dercartar
    %os 16 mais significativos que se encontram na coluna 3.
    controller.n5 = data{strcmp(data{:,1},'15'),[2 4 5 6]};
    controller.n5 = cellfun(@str2doubleq,controller.n5);
end