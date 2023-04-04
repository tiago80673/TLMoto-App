%Essa função e todas as funções invocadas por ela tiveram um cuidado
%especial com o tempo de processamento. Por conta disso foi utilizada uma
%função chamada str2doubleq escrita em c++ utilizando técnicas que tornam a
%função mais rapida que a str2double built in do matlab

function [battery,gps,susp,controller,temp] = dataProces(fileName)
          
          data = importfile(fileName);
          battery = struct('assembly',0,'pack1',0,'pack2',0,'pack3',0,'pack4',0,'pack5',0);
          controller = struct('n1',0,'n2',0,'n3',0,'n4',0,'n5',0);
          temp = struct ('pack12',0,'pack34',0,'Pack5',0);

          battery = batteryProces(data);
          gps = gpsProces(data);
          susp = suspProces(data);
          controller = controllerProces(data);
          temp = tempProces(data);
            
          [battery,gps,susp,controller,temp]= dataCompute(battery,gps,susp,controller,temp);

end

% [battery,gps,susp,controller,temp] = dataProces('Primeira_Saida.txt');
% [battery,gps,susp,controller,temp] = dataCompute(battery,gps,susp,controller,temp);
% meta = [-9.188870809998459,-9.188762851087874 ; 39.26642438391545, 39.26641140518718 ];
% lapTime = lapSeparate (gps,meta);