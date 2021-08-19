# free5gc_ueransim_docker

1. Build docker images

   For free5gc
    docker build -f Dockerfile --tag free5gc:3.0.5 .
    docker build -f Dockerfile --tag free5gc_webconsole:1.0.1 .
    
   For ueransim
    docker build -f Dockerfile --tag ueransimforfree5gc:3.2.2 .
 
 2. Run containers
   
   For free5gc
    docker-compose -f ngc.yaml up -d
   
   For gnb
    docker-compose -f 1gnb.yaml up -d
    
 3. Input subscriber with webconsole
    http://localhost:5000
    admin/free5gc
 
 4. Run containers
    
    For ue
     docker-compose -f 1ue.yaml up -d
     
 5. Remove all
    docker-compose -f ngc.yaml down
    docker-compose -f 1gnb.yaml down
    docker-compose -f 1ue.yaml down
     
