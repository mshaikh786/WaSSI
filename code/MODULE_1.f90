
      Module common_var
      implicit none

! Grid numbers
      INTEGER MAX_GRIDS, MAX_YEARS
      ! PARAMETER (MAX_GRIDS=10108,MAX_YEARS=32)

! BASIC
      INTEGER NGRID,NYEAR,NLC,BYEAR,IYSTART,IYEND
      COMMON/BASIC/NGRID,NYEAR,NLC,BYEAR,IYSTART,IYEND

! LANDCHANGE     
      REAL FPERD, FPERDLAI  
      COMMON/LANDCHANGE/FPERD,FPERDLAI	  
	  
	  
! VAL This is used for model calibration       
      REAL VAL_1, VAL_2, VAL_3,VAL_4,VAL_5,VAL_6 
      COMMON/VAL/VAL_1(100), VAL_2(100), VAL_3,VAL_4,VAL_5,VAL_6

! VALID This is used for model valiadation	  
	  REAL BASEFLOW_V,FLOW_V,FLOW
		 COMMON/VALID2/BASEFLOW_V(MAX_YEARS,12), FLOW_V(MAX_YEARS,12),FLOW(MAX_YEARS,12)
		 
		 
! VALID This is used for model valiadation
!      REAL GEP_V,ET_V,GPP_V,NPP_V,RUNOFF_V,RUN_OFF
        
		REAL,POINTER:: GEP_V(:,:,:), ET_V(:,:,:)&
		,GPP_V(:,:),NPP_V(:,:)&
		,RUNOFF_V(:,:),RUN_OFF(:,:)
      

! CELLINFO
!		REAL LADUSE,LATUDE,LONGI,HUCELE
!		INTEGER HUCNO
		INTEGER,POINTER:: HUCNO(:)
		REAL,POINTER:: LADUSE(:),LATUDE(:),LONGI(:),HUCELE(:)

! VEGINFO
!      INTEGER veg
		INTEGER,POINTER:: VEG(:,:)


! OUTPUT1
!      REAL PET,PAET,AET,RUNOFF,BASEFLOW,PRIBF,SECBF,INTF,TRUNOFF, &
!         RUN_HRU,BASE_HRU
		REAL,POINTER:: PET(:,:,:),PAET(:,:,:),AET(:,:, :),&
		RUNOFF(:,:,:) ,BASEFLOW(:,:,:), PRIBF(:,:,:) , &
		SECBF(:,:,:) , TRUNOFF(:,:,:), &
		INTF(:,:,:), RUN_HRU(:,:,:),BASE_HRU(:,:,:)  


! Monthly RUNOFF

       ! Real RUNOFF_MON, BASEFLOW_MON
		REAL,POINTER:: RUNOFF_MON(:,:),BASEFLOW_MON(:,:)
      
! CLIMATE      
      ! REAL  RAIN,TEMP,AAPPT
		REAL,POINTER:: RAIN(:,:,:), TEMP(:,:,:), AAPPT(:)
      
! LAI        
      ! REAL LAI
		REAL,POINTER:: LAI(:,:,:)

! SNOWPACK	
      ! REAL SP
	  ! INTEGER NSPM
		INTEGER,POINTER:: NSPM(:,:)
		REAL,POINTER:: SP(:,:,:)

! SUMMARY1 
      ! REAL ANURAIN,ANURUN,ANUPET,ANUAET,ANUPAET,RAINALL, AETALL, PETALL, RUNALL, RUNRATIO,ETRATIO_GRD,TRATIO,RALL
	  ! INTEGER NUM_Year
		INTEGER,POINTER:: NUM_Year(:)
		REAL,POINTER:: ANURAIN(:,:),ANURUN(:,:),ANUPET(:,:),&
		ANUAET(:,:),ANUPAET(:,:),&
		RAINALL(:), AETALL(:), PETALL(:), RUNALL(:), RUNRATIO(:),&
		ETRATIO_GRD(:),TRATIO(:),RALL(:)

! SOIL parameters input
      ! REAL LZTWM, LZFPM, LZFSM,LZSK,LZPK, UZTWM, UZFWM, UZK, ZPERC,&
        ! REXP, PFREE        
		REAL,POINTER:: LZTWM(:), LZFPM(:), LZFSM(:), LZSK(:),LZPK(:), UZTWM(:), &
		UZFWM(:),UZK(:), ZPERC(:),REXP(:), PFREE(:)

! Soil Mositure (AV-average,EM-end of month)
       ! REAL AVSMC,AVUZTWC,AVUZFWC,AVLZTWC,AVLZFPC,AVLZFSC,EMSMC,EMUZTWC,EMUZFWC,EMLZTWC,EMLZFPC,EMLZFSC
		REAL,POINTER:: AVSMC(:,:,:),AVUZTWC(:,:,:), AVUZFWC(:,:,:), &
		AVLZTWC(:,:,:), AVLZFPC(:,:,:),AVLZFSC(:,:,:), &
		EMSMC(:,:,:),EMUZTWC(:,:,:),EMUZFWC(:,:,:),&
		EMLZTWC(:,:,:), EMLZFPC(:,:,:),EMLZFSC(:,:,:)
	   
! FLOW 
      ! REAL STRFLOW,STRET,STRGEP     
		REAL,POINTER:: STRFLOW(:,:,:),STRET(:,:,:),&
		STRGEP(:,:,:)

! CARBON
        ! REAL GEPM,RECOM,NEEM,GEPA,NEEA,AHUCGEP, AHUCNEE,AHUCRE
		! INTEGER NUM_YEAR_C
		INTEGER,POINTER:: NUM_YEAR_C(:)
		REAL,POINTER:: GEPM(:,:,:),RECOM(:,:,:), &
		NEEM(:,:,:),GEPA(:,:),NEEA(:,:),&
		AHUCGEP(:), AHUCNEE(:),AHUCRE(:)
      
! HUCPETAET
      ! REAL HUCAET, HUCPET,HUCPAET
		REAL,POINTER:: HUCAET(:,:), HUCPET(:,:),&
		HUCPAET(:,:)
  
! R	  
!	  REAL RFACTOR,ETRATIO,ARUNRT,AETRT 
		REAL,POINTER:: RFACTOR(:,:),ETRATIO(:,:),&
		ARUNRT(:,:), AETRT(:,:)
	  
		REAL,POINTER:: RUNLAND(:,:,:,:),ETLAND(:,:,:,:),GEPLAND(:,:,:,:)
	  
      end

	  
	  
	  
	  
	  