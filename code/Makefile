FC= ftn
OBJ= GENERAL.o PET.o VALIDATION.o CARBONBAL.o OUTPUT.o SUMMARY.o WARMUP.o WATERBAL.o ARRAY_ALLO.o ARRAY_DEALLO.o MPI_SUBROUTINES.o PARALLEL_FILE_IO.o
SRC=GENERAL.f90 PET.f90 VALIDATION.f90 CARBONBAL.f90 OUTPUT.f90 SUMMARY.f90 WARMUP.f90 WATERBAL.f90 ARRAY_ALLO.f90 ARRAY_DEALLO.f90 MPI_SUBROUTINES.f90 PARALLEL_FILE_IO.f90
DEBUG = 
PRGENV= ${PE_ENV}
PREPROCESS= 
LDFLAGS_MAP_DYNAMIC=-dynamic -L/group/pawsey0001/mshaikh/software/cle52up04/forge-libs/GNU/4.8.2 -lmap-sampler-pmpi -lmap-sampler -Wl,--eh-frame-hdr -Wl,-rpath=/group/pawsey0001/mshaikh/software/cle52up04/forge-libs/GNU/4.8.2
LDFLAGS_MAP_STATIC=-Wl,@/group/pawsey0001/mshaikh/software/cle52up04/forge-libs/GNU/4.8.2/allinea-profiler.ld -L/pawsey/cle52up04/devel/binary/forge/7.0.4/lib/64 -ldmallocth -Wl,--allow-multiple-definition 
LDFLAGS=
ifeq ($(PRGENV),INTEL)
	OMPFLAG=-openmp
	DEBUG=-g -dynamic -mcmodel=medium -fpp -fPIC
else ifeq ($(PRGENV),GNU)
	OMPFLAG=-fopenmp
	DEBUG=-g -mcmodel=medium -cpp -fPIC
else ifeq ($(PRGENV),CRAY)
	OMPFLAG= -homp
	DEBUG=-G2 -dynamic -hpic -fPIC
	PREPROCESS="-F" 
#	CRAY_REVEAL="-h profile_generate"
endif 


FCFLAGS = $(DEBUG) $(CRAY_REVEAL) $(FPPFLAGS)
FFLAGS = $(DEBUG)


EXE=WaSSI
all: $(OBJ)
	$(FC) $(FFLAGS) $(PREPROCESS) $+ $(OMPFLAG) -o $(EXE) $(LDFLAGS)
map-static:
	$(FC) -static $(FCFLAGS) $(OMPFLAGS) $(SRC) -o WaSSI-MAP-static $(LDFLAGS_MAP_STATIC)
map-dynamic: $(OBJ)
	$(FC) $(FFLAGS) $(PREPROCESS)  $(OMPFLAG) $(OBJ) -o WaSSI-MAP-dynamic  $(LDFLAGS_MAP_DYNAMIC)
%.o: %.f90 
	$(FC) $(FCFLAGS) $(PREPROCESS) -c $(OMPFLAG) $<
clean:
	rm *.o *.mod $(EXE) WaSSI-MAP-static WaSSI-MAP-dynamic fort.* file* 

