FROM kalilinux/kali-rolling

#Install Tools
RUN apt-get update -y
RUN apt-get install zsh -y
RUN chsh -s $(which zsh)
RUN apt-get install net-tools -y
RUN apt-get install iputils-ping -y
RUN apt-get install ssh -y
RUN apt-get install tmux -y
RUN apt-get install vim -y
RUN apt-get install nano -y
RUN apt-get install sudo -y
RUN apt-get install metasploit-framework -y
RUN apt-get install nmap -y
RUN apt-get install git -y
RUN apt-get install ssh -y
RUN apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get install python2.7 -y
RUN apt-get install python-pip -y
RUN apt-get install python3-pip -y
RUN apt-get install python3 -y
RUN mv /usr/bin/python2.7 /usr/bin/python
RUN cd /opt && git clone https://github.com/3ndG4me/torphantom.git
#RUN apt-get install mysql -y
RUN apt-get install php -y
RUN apt-get install g++ -y
RUN apt-get install locate -y 
RUN updatedb
#Copy ssh configuration  
COPY config-files/sshd_config /etc/ssh/
RUN service ssh restart

COPY Pentest-Toolkit /opt/
RUN chmod 755 -R /opt/Lateral-Movement

#Setup user 
RUN adduser ghosty
RUN usermod -aG sudo ghosty
RUN echo "ghosty:ghosty" | chpasswd
RUN echo "root:toor" | chpasswd
#RUN usermod -L root
#RUN usermod root -s /sbin/nologin
COPY config-files/ohmyzsh.sh /home/ghosty/
#RUN sh /home/ghosty/ohmyzsh.sh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -t aussiegeeke


CMD ["/usr/bin/zsh"]

#Open Ports
EXPOSE 80
EXPOSE 443
EXPOSE 22

