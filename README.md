
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<h1>Implementação de atualizações de software e segurança</h1>
		<p>Neste laboratório, vamos aprender como realizar atualizações de software e implementar medidas de segurança em um servidor web com o sistema operacional Ubuntu. Para isso, vamos utilizar o Vagrant para criar um ambiente virtual e simular um servidor web.</p>


<h2>Tecnologias utilizadas:</h2>
	<ul>
		<li><a href="https://www.vagrantup.com/" target="_blank"><img src="https://img.icons8.com/windows/32/000000/vagrant.png"/> Vagrant</a></li>
		<li><a href="https://www.virtualbox.org/" target="_blank"><img src="https://img.icons8.com/windows/32/000000/virtualbox.png"/> VirtualBox</a></li>
		<li><a href="https://www.fail2ban.org/" target="_blank"><img src="https://img.icons8.com/windows/32/000000/firewall.png"/> Fail2Ban</a></li>
	</ul>
	
<h2>Passo a passo:</h2>
	<p><em>Observação: Este laboratório foi desenvolvido utilizando o sistema operacional Ubuntu 18.04 e as versões mais recentes do Vagrant e do VirtualBox. Certifique-se de ter esses programas instalados em sua máquina antes de prosseguir.</em></p>
	
<h3>1. Criação do ambiente virtual</h3>
	<p>Para criar o ambiente virtual, siga os passos abaixo:</p>
	<ol>
		<li>Baixe ou clone este projeto em sua máquina.</li>
		<li>Abra um terminal na pasta raiz do projeto.</li>
		<li>Execute o comando abaixo para criar e provisionar a máquina virtual:</li>
		<pre><code>vagrant up</code></pre>
		<li>Após a criação da máquina virtual, acesse-a com o comando abaixo:</li>
		<pre><code>vagrant ssh</code></pre>
		<li>Agora você está dentro do ambiente virtual e pode realizar as configurações necessárias.</li>
	</ol>
	
<h3>2. Atualização de software</h3>
	<p>Para atualizar os softwares do servidor, siga os passos abaixo:</p>
	<ol>
		<li>Atualize a lista de pacotes:</li>
		<pre><code>sudo apt-get update</code></pre>
		<li>Atualize os pacotes:</li>
		<pre><code>sudo apt-get upgrade</code></pre>
		<li>Remova pacotes obsoletos:</li>
		<pre><code>sudo apt-get autoremove</code></pre>
	</ol>
	
<h3>3. Implementação de segurança</h3>
	<p>Para implementar medidas de segurança, vamos instalar e configurar o Fail2Ban:</p>
	<ol>
	<li>Instale o Fail2Ban:</li>
	<pre><code>sudo apt-get install fail2ban</code></pre>
<li>Crie uma cópia do arquivo de configuração de exemplo:</li>
	<pre><code>sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local</code></pre>
<li>Edite o arquivo jail.local com o editor de sua preferência:</li>
	<pre><code>sudo nano /etc/fail2ban/jail.local</code></pre>
<li>Localize a seção [sshd] e altere as seguintes linhas:</li>
	<pre><code>port = 22
logpath = %(sshd_log)s</code></pre>
<li>Salve e feche o arquivo.</li>
<li>Reinicie o Fail2Ban:</li>
	<pre><code>sudo service fail2ban restart</code></pre>
Agora, o Fail2Ban está configurado para monitorar as tentativas de login no servidor SSH e bloquear temporariamente os endereços IP que realizarem tentativas inválidas. Para visualizar as estatísticas e os endereços IP bloqueados, utilize o comando:

<pre><code>sudo fail2ban-client status sshd</code></pre>
Para verificar se o Fail2Ban está rodando corretamente, execute o comando:

<pre><code>sudo fail2ban-client ping</code></pre>
Se a resposta for "pong", o Fail2Ban está rodando corretamente.

Tecnologias utilizadas:

Para este projeto foram utilizadas as seguintes tecnologias:

Ubuntu 20.04
SSH
UFW
Fail2Ban
Caso tenha alguma dúvida ou problema durante a configuração, consulte a documentação oficial de cada tecnologia ou contate o suporte técnico responsável.