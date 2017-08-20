#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
	long int i,j;
	char filename[256],bin_file[256];
	FILE *fr,*fw;
	long int m,n;
	long int nelement=0;
	char *ptrn,*ptrm;
	if (argc > 1){
		for ( i=0; i<argc; i++){
			if (argv[i][0] == '-'){
				if (argv[i][1] == 'o'){
					sprintf(filename,"%s",argv[i+1]);
				}else if (argv[i][1] == 'i'){
					sprintf(bin_file,"%s",argv[i+1]);
				}else if (argv[i][1] == 'm'){
					m = strtol(argv[i+1],&ptrm,10);
				}else if (argv[i][1] == 'n'){
					n = strtol(argv[i+1],&ptrn,10);
				}
			}
		}
		fprintf (stdout,"Processing %s to convert in ASCII file %s.\n",bin_file,filename);
		fprintf (stdout,"m = %ld, n =%ld\n",m,n);
	}else{
		fprintf (stderr,"Invalid arguments:\n");
		fprintf (stderr,"Options:\n"
				"-i  Filename to input Binary file\n"
				"-o  Filename of output ASCII file\n"
				"-m  Number of lines in the file\n"
				"-n  Number of columns in each line\n");
		abort();
	}
	nelement = m*n;

	fr=fopen(bin_file,"rb");
	fseek(fr, SEEK_SET, 0);
	float *buffer;
	buffer=(float*) malloc(nelement*sizeof(float));
	fread(buffer, sizeof(float), nelement, fr);
	fclose(fr);


	fw=fopen(filename,"w");

	for (i=0; i<m; i++){
		for (j=0; j<n; j++){
			fprintf(fw,"%5.5f  ",buffer[i*n + j]);
			//prlong longf("%5.5f  ",buffer[i*n + j]);
		}
		fprintf(fw,"\n");
	}
	fclose(fw);

	free(buffer);

	
}