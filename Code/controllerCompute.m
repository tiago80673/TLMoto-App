%Esta função realiza os devidos calculos de forma a corrigir os dados e
%coloca-los na unidade de medida desejada
function [controller] = controllerCompute(controller)

    %Consultar ficheiro com significado de cada entrada em caso de duvidas
    
    %Conversão de complemento para dois
    twos2dec = @(x, b) x-(x>=2^(b-1))*2^b;

    %%Controlador código 11 (n1)
    controller.n1(:,1:4) = twos2dec(controller.n1(:,1:4),16).*0.0625; 
    controller.n1(:,5) = controller.n1(:,5)/1000; 
    
    %%Controlador código 12 (n2)
    controller.n2(:,1:2) = twos2dec(controller.n2(:,1:2),16)*0.0625;
    controller.n2(:,3) = twos2dec(controller.n2(:,3),16)*0.3922;
    controller.n2(:,4) = twos2dec(controller.n2(:,4),16)*0.0625;
    controller.n2(:,5) = controller.n2(:,5)/1000; 
    
    %%Controlador código 13 (n3)
    controller.n3(:,4) = twos2dec(controller.n3(:,4),16)*0.0625; 
    controller.n3(:,5) = controller.n3(:,5)/1000; 
    
    %%Controlador código 14 (n4)
    controller.n4(:,1) = controller.n4(:,1) * 0.0625;
    controller.n4(:,3) = controller.n4(:,3) * 0.0625/8;
    controller.n4(:,4) = twos2dec(controller.n4(:,4),16) * 16;
    controller.n4(:,5) = controller.n4(:,5) / 1000;
    
    %%Controlador código 15 (n5)
    % Só usaremos os 16 bits menos significativos do RPM, ou seja a coluna 1
    controller.n5(:,1) = twos2dec(controller.n5(:,1),16); 
    controller.n5(:,2) = controller.n5(:,2) * 0.0039; 
    controller.n5(:,3) = controller.n5(:,3) * (3.0518509e-5);
    controller.n5(:,4) = controller.n5(:,4) / 1000; 
        
end
