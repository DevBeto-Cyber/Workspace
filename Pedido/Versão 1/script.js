let naoButtonClickCount = 0; // contador para o botão "nao"
let naoButtonState = 0; // estado atual do botão "nao"

// mostra o gif inicial
document.getElementById('gifContainer').style.display = 'block';
document.getElementById('simBtn').addEventListener('click', function() {
    // trocar o gif triste e mostrar o gif feliz
    document.getElementById('sadGifContainer').style.display = 'none';
    document.getElementById('sadGifContainer1').style.display = 'none';
    document.getElementById('sadGifContainer2').style.display = 'none';
    document.getElementById('gifContainer').style.display = 'none';
    document.getElementById('happyGifContainer').style.display = 'block';

    // mover os botões sím" e "nao"
    document.getElementById('question').style.display = 'none';
    document.getElementById('simBtn').style.display = 'none';
    document.body.classList.add('bg-green');
    document.getElementById('naoBtn').style.display = 'none';

    // mostrar a mensagem específica
    document.getElementById('messageContainer').style.display = 'block';
    document.getElementById('messageContainer').innerHTML = 'YUUUPIIII!!';

    // mostrar outro gif após 3 segundos
    setTimeout(function() {
        document.getElementById('happyGifContainer').style.display = 'none';
        document.getElementById('happyGifContainer2').style.display = 'block';
    }, 1000);
    setTimeout(function() {
        document.getElementById('happyGifContainer2').style.display = 'none';
        document.getElementById('happyGifContainer3').style.display = 'block';
    }, 2000);
    setTimeout(function() {
        document.getElementById('happyGifContainer3').style.display = 'none';
        document.getElementById('happyGifContainer4').style.display = 'block';
    }, 3000);
});

// trabalhando com o botão "nao"
document.getElementById('naoBtn').addEventListener('click', function() {
    switch (naoButtonState) {
        case 0:
            document.getElementById('happyGifContainer').style.display = 'none';
            document.getElementById('gifContainer').style.display = 'none';
            document.getElementById('sadGifContainer').style.display = 'block';

            // modificar o botão "nao"
            document.getElementById('naoBtn').innerHTML = 'Tem certeza disso 😓?';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';
            document.getElementById('simBtn').style.fontSize = '40px';
            document.getElementById('simBtn').style.padding = '20px 40px';
            naoButtonClickCount++;
            naoButtonState++;
            break;

        case 1:
            // segunda vez mexendo no botão "nao"

            document.getElementById('naoBtn').innerHTML = 'Não faça isso comigo por favor..';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';
            document.getElementById('sadGifContainer').style.display = 'none';
            document.getElementById('sadGifContainer2').style.display = 'block';

            // fazendo que o botão "sim" cresça
            document.getElementById('simBtn').style.fontSize = '50px';
            document.getElementById('simBtn').style.padding = '30px 50px';
        
            naoButtonState++;
            break;

        case 2:
           
            document.getElementById('naoBtn').innerHTML = 'Tem certeza de verdade?';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';
            document.getElementById('sadGifContainer').style.display = 'none';
            document.getElementById('sadGifContainer2').style.display = 'none';
            document.getElementById('sadGifContainer1').style.display = 'block';

            // fazendo o botão "sim" crescer novamente
            document.getElementById('simBtn').style.fontSize = '60px';
            document.getElementById('simBtn').style.padding = '40px 60px';
        
            naoButtonState++;
            break;
        
        case 3:
           
            document.getElementById('naoBtn').innerHTML = 'Eu te amo muito, não faça isso comigo..';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // fazendo o botão "sim" crescer outra vez
            document.getElementById('simBtn').style.fontSize = '70px';
            document.getElementById('simBtn').style.padding = '50px 70px';
        
            naoButtonState++;
            break;
        case 4:
           
            document.getElementById('naoBtn').innerHTML = 'Fala que sim por favor 🥺';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // outra vez
            document.getElementById('simBtn').style.fontSize = '80px';
            document.getElementById('simBtn').style.padding = '60px 80px';
         
            naoButtonState++;
            break;
        case 5:
           
            document.getElementById('naoBtn').innerHTML = 'Não me deixe.. eu te amo muito..';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // outra vez
            document.getElementById('simBtn').style.fontSize = '90px';
            document.getElementById('simBtn').style.padding = '70px 90px';

            naoButtonState++;
            break;
        case 6:
           
            document.getElementById('naoBtn').innerHTML = 'Fala quem sim eu suplico..';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // outra vez
            document.getElementById('simBtn').style.fontSize = '100px';
            document.getElementById('simBtn').style.padding = '80px 100px';
            
            naoButtonState++;
            break;
        case 7:
           
            document.getElementById('naoBtn').innerHTML = 'Estou muito triste..';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // outra vez
            document.getElementById('simBtn').style.fontSize = '120px';
            document.getElementById('simBtn').style.padding = '90px 120px';
  
            naoButtonState++;
            break;
        case 8:
           
            document.getElementById('naoBtn').innerHTML = 'Estou muito muito muito triste';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            document.getElementById('simBtn').style.fontSize = '140px';
            document.getElementById('simBtn').style.padding = '100px 140px';
       
            naoButtonState++;
            break;

        case 9:
           
            document.getElementById('naoBtn').innerHTML = 'Estou muito muito muito muito triste.';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // outra vez
            document.getElementById('simBtn').style.fontSize = '160px';
            document.getElementById('simBtn').style.padding = '110px 160px';
          
            naoButtonState++;
            break;

        case 10:
           
            document.getElementById('naoBtn').innerHTML = 'Ok.. pararei de insistir.';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

         
            document.getElementById('simBtn').style.fontSize = '180px';
            document.getElementById('simBtn').style.padding = '120px 180px';
    
            naoButtonState++;
            break;
        case 11:
           
            document.getElementById('naoBtn').innerHTML = 'É mentira rs, me da uma chance por favor só umazinha';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            document.getElementById('simBtn').style.fontSize = '200px';
            document.getElementById('simBtn').style.padding = '130px 200px';
            
            naoButtonState++;
            break;
        
        case 12:
           
            document.getElementById('naoBtn').innerHTML = 'Prometo te fazer muitão feliz se aceitar 🥺';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // outra vez
            document.getElementById('simBtn').style.fontSize = '220px';
            document.getElementById('simBtn').style.padding = '140px 220px';
    
            naoButtonState++;
            break;
        
        case 13:
           
            document.getElementById('naoBtn').innerHTML = 'Meu coração dói por favor não faça isso comigo 😓';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            document.getElementById('simBtn').style.fontSize = '240px';
            document.getElementById('simBtn').style.padding = '150px 240px';
         
            naoButtonState++;
            break;
        
        case 14:
           
            document.getElementById('naoBtn').innerHTML = '...';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // outra vez
            document.getElementById('simBtn').style.fontSize = '260px';
            document.getElementById('simBtn').style.padding = '160px 260px';
            
            naoButtonState++;
            break;
        
        case 15:
           
            document.getElementById('naoBtn').innerHTML = 'Anda fala que SIMMMMMMMMMMMM';
            document.getElementById('naoBtn').style.backgroundColor = '#F1330A';

            // última vez
            document.getElementById('simBtn').style.fontSize = '280px';
            document.getElementById('simBtn').style.padding = '170px 280px';
          
            naoButtonState++;
            break;
        
     
        case 16:
                document.getElementById('naoBtn').innerHTML = 'Porfavooooorrr';
                document.getElementById('naoBtn').style.backgroundColor = '#F1330A';
              
                document.getElementById('sadGifContainer').style.display = 'none';
                document.getElementById('sadGifContainer1').style.display = 'none';
                document.getElementById('sadGifContainer2').style.display = 'none';
                document.getElementById('gifContainer').style.display = 'block';
                document.getElementById('happyGifContainer').style.display = 'none';
                // volta tudo ao estado zero
                naoButtonState = 0;
                break;
        

        default:
            // caso queira adicionar mais opções escreva abaixo
            break;
    }
});