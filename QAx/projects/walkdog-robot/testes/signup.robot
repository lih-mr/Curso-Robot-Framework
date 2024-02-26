*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup    Start session

Test Teardown    Finish session 

*** Test Cases ***
Deve pode cadastrar um novo dog walker
    [Tags]    smoke

    ${dog_walker}    Create Dictionary    
    ...    name=Lívia Marconi    
    ...    email=liviamarconi31@gmail.com    
    ...    cpf=46771167844    
    ...    cep=02996080    
    ...    addressStreet=Rua Domenico Montella    
    ...    addressDistrict=Parque Nações Unidas    
    ...    addressCityUF=São Paulo/SP    
    ...    addressNumber=25    
    ...    addressDetails=Ao lado do 121    
    ...    cnh=toretto.jpg


   Go to signup page
   Fill signup form    ${dog_walker}
   Sleep    5
   Submit signup form
   Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.


Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    #${dog_walker}    Create Dictionary    
    #...    name=Lívia Marconi    
    #...    email=liviamarconi31@gmail.com    
    #...    cpf=46771167844    
    #...    cep=02996080    
    #...    addressStreet=Rua Domenico Montella    
    #...    addressDistrict=Parque Nações Unidas    
    #...    addressCityUF=São Paulo/SP    
    #...    addressNumber=25    
    #...    addressDetails=Ao lado do 121    
    #...    cnh=toretto.jpg


   Go to signup page
   #Fill signup form    ${dog_walker}
   Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)



Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv    

    ${dog_walker}    Create Dictionary    
    ...    name=Lívia Marconi    
    ...    email=liviamarconi31@gmail.com    
    ...    cpf=467711678aa  
    ...    cep=02996080    
    ...    addressStreet=Rua Domenico Montella    
    ...    addressDistrict=Parque Nações Unidas    
    ...    addressCityUF=São Paulo/SP    
    ...    addressNumber=25    
    ...    addressDetails=Ao lado do 121    
    ...    cnh=toretto.jpg


   Go to signup page
   Fill signup form    ${dog_walker}
   Submit signup form
   Wait For Elements State    css=.alert-error >> text=CPF inválido    visible    5


    
Deve pode cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    care

    ${dog_walker}    Create Dictionary    
    ...    name=Jessica Marconi   
    ...    email=jessiquinha_mr@hotmail.com    
    ...    cpf=46771167844    
    ...    cep=02996080    
    ...    addressStreet=Rua Domenico Montella    
    ...    addressDistrict=Parque Nações Unidas    
    ...    addressCityUF=São Paulo/SP    
    ...    addressNumber=25    
    ...    addressDetails=Ao lado do 121    
    ...    cnh=toretto.jpg

   Go to signup page
   Fill signup form    ${dog_walker}
   Additional Service    Cuidar
   Submit signup form
   Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve pode cadastrar um novo dog walker que sabe adestrar pets
    [Tags]    care

    ${dog_walker}    Create Dictionary    
    ...    name=Nadia Marconi   
    ...    email=nadiamr@hotmail.com    
    ...    cpf=46771167844    
    ...    cep=02996080    
    ...    addressStreet=Rua Domenico Montella    
    ...    addressDistrict=Parque Nações Unidas    
    ...    addressCityUF=São Paulo/SP    
    ...    addressNumber=25    
    ...    addressDetails=Ao lado do 121    
    ...    cnh=toretto.jpg

   Go to signup page
   Fill signup form    ${dog_walker}]
   Additional Service    Adestrar
   Submit signup form
   Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.