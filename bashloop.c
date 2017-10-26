#include <stdio.h>                                                 
#include <stdlib.h>                                                
#include <string.h>                                                
#include <unistd.h>                                                
#include <sys/types.h>                                             
                                                                   
int main(int argc, char *argv[]){
  if (argc != 2) {
    fprintf(stderr,"please enter a number in 0 to 9900\n");
    return 1;

  }
  if (argv[1]==9876){
    print ("flag{this_is_answer}");
  }
  else{
    print ("you are wrong.");
  }

}                                                                
