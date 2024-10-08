function lap = lapOrganize(lapTime,battery,controller,gps,susp,temp)
% Está função foi criada para organizar em um único vector de estruturas todos os dados que serão utilizados na GUI,
% cada entrada deste vector representa uma volta da mota na pista.

%%Inicializações
%     É importante lembrar que para realizar as separações é preciso considerar que o tempo
%     fornecido pela variavel lapTime corresponde ao primeiro ponto de cada
%     volta
    
    lap = struct('battery',0,'controller',0,'gps',0,'susp',0,'temp',0);
    ii = length(lapTime);
%% Battery

    
 % Serve para mostrar qual o tipo da variavel lap.battery 
    lap(1).battery = battery;
    lap(1).battery.assembly = battery.assembly(battery.assembly(:,9)<lapTime(1),:);
    lap(1).battery.pack1 = battery.pack1(battery.pack1(:,9)<lapTime(1),:);
    lap(1).battery.pack2 = battery.pack2(battery.pack2(:,9)<lapTime(1),:);
    lap(1).battery.pack3 = battery.pack3(battery.pack3(:,9)<lapTime(1),:);
    lap(1).battery.pack4 = battery.pack4(battery.pack4(:,9)<lapTime(1),:);
    lap(1).battery.pack5 = battery.pack5(battery.pack5(:,9)<lapTime(1),:);
    
    for jj = 2:ii
        lap(jj).battery.assembly = battery.assembly(battery.assembly(:,9)<lapTime(jj)...
            & battery.assembly(:,9)>=lapTime(jj-1),:);
        lap(jj).battery.pack1 = battery.pack1(battery.pack1(:,9)<lapTime(jj)...
            & battery.pack1(:,9)>=lapTime(jj-1),:);
        lap(jj).battery.pack2 = battery.pack2(battery.pack2(:,9)<lapTime(jj)...
            & battery.pack2(:,9)>=lapTime(jj-1),:);  
        lap(jj).battery.pack3 = battery.pack3(battery.pack3(:,9)<lapTime(jj)...
            & battery.pack3(:,9)>=lapTime(jj-1),:);  
        lap(jj).battery.pack4 = battery.pack4(battery.pack4(:,9)<lapTime(jj)...
            & battery.pack4(:,9)>=lapTime(jj-1),:);  
        lap(jj).battery.pack5 = battery.pack5(battery.pack5(:,9)<lapTime(jj)...
            & battery.pack5(:,9)>=lapTime(jj-1),:);  
    end
    
    lap(ii+1).battery.assembly = battery.assembly(battery.assembly(:,9)>=lapTime(ii),:);
    lap(ii+1).battery.pack1 = battery.pack1(battery.pack1(:,9)>=lapTime(ii),:);
    lap(ii+1).battery.pack2 = battery.pack2(battery.pack2(:,9)>=lapTime(ii),:);
    lap(ii+1).battery.pack3 = battery.pack3(battery.pack3(:,9)>=lapTime(ii),:);
    lap(ii+1).battery.pack4 = battery.pack4(battery.pack4(:,9)>=lapTime(ii),:);
    lap(ii+1).battery.pack5 = battery.pack5(battery.pack5(:,9)>=lapTime(ii),:);
    
%% Controller
    lap(1).controller = controller;
    
    lap(1).controller.n1 = controller.n1(controller.n1(:,5)<lapTime(1),:);
    lap(1).controller.n2 = controller.n2(controller.n2(:,5)<lapTime(1),:);
    lap(1).controller.n3 = controller.n3(controller.n3(:,5)<lapTime(1),:);
    lap(1).controller.n4 = controller.n4(controller.n4(:,5)<lapTime(1),:);
%     O n5 é o único que tem 4 colunas pelo fato do RPM utilizar 32 bits, para mais detalhes
%     consultar ficheiro de processamento do controllador
    lap(1).controller.n5 = controller.n5(controller.n5(:,4)<lapTime(1),:);
    
    for jj = 2:ii
        lap(jj).controller.n1 = controller.n1(controller.n1(:,5)<lapTime(jj)...
            & controller.n1(:,5)>=lapTime(jj-1),:);
        lap(jj).controller.n2 = controller.n2(controller.n2(:,5)<lapTime(jj)...
            & controller.n2(:,5)>=lapTime(jj-1),:);
        lap(jj).controller.n3 = controller.n3(controller.n3(:,5)<lapTime(jj)...
            & controller.n3(:,5)>=lapTime(jj-1),:);
        lap(jj).controller.n4 = controller.n4(controller.n4(:,5)<lapTime(jj)...
            & controller.n4(:,5)>=lapTime(jj-1),:);
        lap(jj).controller.n5 = controller.n5(controller.n5(:,4)<lapTime(jj)...
            & controller.n5(:,4)>=lapTime(jj-1),:);
    end

    lap(ii+1).controller.n1 = controller.n1(controller.n1(:,5)>=lapTime(ii),:);
    lap(ii+1).controller.n2 = controller.n2(controller.n2(:,5)>=lapTime(ii),:);
    lap(ii+1).controller.n3 = controller.n3(controller.n3(:,5)>=lapTime(ii),:);
    lap(ii+1).controller.n4 = controller.n4(controller.n4(:,5)>=lapTime(ii),:);
    lap(ii+1).controller.n5 = controller.n5(controller.n5(:,4)>=lapTime(ii),:);



%% GPS
%     Neste caso como não temos uma estrutura dentro de estrutura essa linha pode ser retirada
%     lap(1).gps = gps;

    lap(1).gps = gps(gps(:,4)<lapTime(1),:);
    
    for jj = 2:ii
       lap(jj).gps = gps(gps(:,4)<lapTime(jj) & gps(:,4)>= lapTime(jj-1),:); 
    end
    
    lap(ii+1).gps = gps(gps(:,4)>=lapTime(ii),:);
    
%% SUSPENSION     
     lap(1).susp = susp(susp(:,3)<lapTime(1),:);
     
     for jj = 2:ii
       lap(jj).susp = susp(susp(:,3)<lapTime(jj) & susp(:,3)>= lapTime(jj-1),:); 
     end
        
     lap(ii+1).susp = susp(susp(:,3)>=lapTime(ii),:);
     
%%  Temperature
    lap(1).temp = temp;
    
    lap(1).temp.pack12 = temp.pack12(temp.pack12(:,9)<lapTime(1),:);
    lap(1).temp.pack34 = temp.pack34(temp.pack34(:,9)<lapTime(1),:);
    lap(1).temp.pack5 = temp.pack5(temp.pack5(:,9)<lapTime(1),:);
    
     for jj = 2:ii
       lap(jj).temp.pack12 = temp.pack12(temp.pack12(:,9)<lapTime(jj) & temp.pack12(:,9)>= lapTime(jj-1),:); 
       lap(jj).temp.pack34 = temp.pack34(temp.pack34(:,9)<lapTime(jj) & temp.pack34(:,9)>= lapTime(jj-1),:); 
       lap(jj).temp.pack5 = temp.pack5(temp.pack5(:,9)<lapTime(jj) & temp.pack5(:,9)>= lapTime(jj-1),:); 
     end
     
    lap(ii+1).temp.pack12 = temp.pack12(temp.pack12(:,9)>=lapTime(ii),:);
    lap(ii+1).temp.pack34 = temp.pack34(temp.pack34(:,9)>=lapTime(ii),:);
    lap(ii+1).temp.pack5 = temp.pack5(temp.pack5(:,9)>=lapTime(ii),:);
end


