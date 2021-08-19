# free5gc_ueransim_docker

1. Build docker images

   For free5gc
    docker build -f Dockerfile --tag free5gc:3.0.5 .
    docker build -f Dockerfile --tag free5gc_webconsole:1.0.1 .
    
   For ueransim
    docker build -f Dockerfile --tag ueransimforfree5gc:3.2.2 .
 
 3. Install gtp5g
    with install_gtp5g.sh
    
 5. Run containers
   
   For free5gc
    docker-compose -f ngc.yaml up -d
   
   For gnb
    docker-compose -f 1gnb.yaml up -d
    
 4. Input subscriber with webconsole
    http://localhost:5000
    admin/free5gc
 
 5. Run containers
    
    For ue
     docker-compose -f 1ue.yaml up -d
     
 6. Test
 
    - In upf container,
    
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    sudo systemctl stop ufw     
    sudo iptables -I FORWARD 1 -j ACCEPT
    
    - In ue container,
    
    ping -I ping google.com -I uesimtun0 -n
    
    - In upf container,
    
    tcpdump -i eth0 -n
    
    - In ue container,
    
    sh nr-binder 10.45.0.2 curl google.com
    
    
 7. Remove all
    docker-compose -f ngc.yaml down
    docker-compose -f 1gnb.yaml down
    docker-compose -f 1ue.yaml down
     
