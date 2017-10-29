#include <stdio.h>                                                 
#include <stdlib.h>                                                
#include <string.h>                                                
#include <unistd.h>                                                
#include <sys/types.h>                                             
                                                                   
int main(int argc, char **argv){                                   
  FILE* authf = fopen("../../problems/binary_exploitation/auth","r");
  if(authf == NULL){                                               
    printf("could not find auth file in ../../problems/binary_exploitation/\n");                                         
    return 0;                                                      
  }                                                                
  char auth[8];                                                    
  fgets(auth,8,authf);                                             
  fclose(authf);                                                 
  if(strlen(auth) != strlen("no")){                                        
    FILE* flagf;                                                   
    flagf = fopen("/problems/binary_exploitation/flag","r");                                                             
    char flag[64];                                                 
    fgets(flag,64,flagf);                                          
    printf("Oh. Well the auth file doesn't say no anymore so... Here's the flag: %s",flag);                                           
    fclose(flagf);                                                 
  }
  else{                                                           
    printf("auth file says no. So no. Just... no.\n");             
  }                                                                
  return 0;                                                        
}                                                                  
