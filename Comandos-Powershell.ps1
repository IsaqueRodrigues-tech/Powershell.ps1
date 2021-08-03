<!-- Exibir o endereço IP atribuído ao computador -->
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . | Format-Table -Property IPAddress

<!-- Criar uma senha aleatória -->
Add-Type -AssemblyName System.Web
[System.Web.Security.Membership]::GeneratePassword(8,2)

<!-- Exibir informações sobre a marca e modelo do computador -->
Get-WmiObject -Class Win32_ComputerSystem

<!-- Exibir informações sobre a BIOS do computador -->
Get-WmiObject -Class Win32_BIOS -ComputerName

<!-- Listar os 5 processos que estão usando mais memória -->
ps | sort –p ws | select –last 5

<!-- Visualizar as configurações de rede atuais dos adaptadores -->
Get-NetIPConfiguration

<!-- Listar os adaptadores e seus respectivos endereços IP -->
Get-NetIPAddress | Sort InterfaceIndex | FT InterfaceIndex, InterfaceAlias, IPAddress -Autosize

<!-- Obter informações apenas de interfaces configuradas com IPv4 -->
Get-NetIPAddress | ? AddressFamily -eq IPv4 | FT –AutoSize

<!-- Listar os adaptadores de rede presentes no computador, com seus nomes, descrição, status, endereços MAC e taxa de transmissão -->
Get-NetAdapter

<<!-- Obter informações sobre um adaptador em particular (por exemplo, Ethernet) -->
Get-NetAdapter Ethernet

<!-- Testar conexão a um host (ping) -->
Test-NetConnection www.bosontreinamentos.com.br

<!-- Testar conexão a um host com informações mais detalhadas -->
Test-NetConnection www.bosontreinamentos.com.br -InformationLevel Detailed

<!-- Testar conexão a um host e mostrar somente o IP do host, resultado do teste e RTT da conexão -->
Test-NetConnection www.bosontreinamentos.com.br | Select -ExpandProperty PingReplyDetails | FT Address, Status, RoundTripTime

<!-- Descobrir informações sobre os servidores DNS associados a um host (similar a NSLOOKUP) -->
Resolve-DNSName www.planetaunix.com.br

<!-- Traçar a rota até um determinado host remoto (tracert) -->
Test-NetConnection www.planetaunix.com.br -TraceRoute

 <!-- Visualizar as conexões de rede TCP/IP atuais da máquina (similar ao netstat)-->
 Get-NetTCPConnection
 
 <!-- Visualizar somente as conexões de rede TCP/IP estabelecidas (status ESTABLISHED) -->
 Get-NetTCPConnection | ? State -eq Established | FT –Autosize
 
 <!-- Visualizar somente as conexões de rede TCP/IP cuja porta remota é a de número 80 -->
 Get-NetTCPConnection | ? RemotePort -eq 80 | FT –Autosize
 
 <!--  Visualizar somente as conexões de rede cujo endereço IP remoto seja diferente de 0.0.0.0 -->
 Get-NetTCPConnection | ? RemoteAddress -notlike 0.0.0.0 | FT –Autosize
 
 <!-- Desabilitar a interface de rede de nome Ethernet -->
 Disable-NetAdapter Ethernet
 
 <!--  Habilitar novamente a interface Ethernet -->
Enable-NetAdapter Ethernet 


