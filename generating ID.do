*****************************************************************
* MERGING ELIGIBLE WOMEN FILE BY BIRTH WITH BIRTH HISTORY FILE*
*****************************************************************

* IN BIRTH HISTORY FILE*
rename EW3 PERSONID
rename BH1 LB1A

* IN ELIGIBLE WOMEN FILE*
drop if LB1A==.
** These are women who did not have any births during the given time period**

* IN BOTH BIRTH HISTORY AND ELIGIBLE WOMEN FILE*
gen str_psu=string(int(IDPSU), "%06.0f")
gen str_hh=string(int(HHID), "%03.0f")
gen str_splithh=string(int(HHSPLITID), "%01.0f")
gen str_mother=string(int(PERSONID), "%02.0f")
gen str_birth=string(int(LB1A), "%02.0f")
egen IDBIRTH=concat(str_psu str_hh str_splithh str_mother str_birth)

* TO CHECK IF GENERATED ID IS UNIQUE*
codebook IDBIRTH

*merge 1:1 by IDBIRTH*
*keep only the observations common in both files i.e. for whom _merge==3*

****************************************************
* MERGING THE MERGED FILE WITH THE INDIVIDUAL FILE *
****************************************************

* IN THE INDIVIDUAL FILE *
gen str_psu=string(int(IDPSU), "%06.0f")
gen str_hh=string(int(HHID), "%03.0f")
gen str_splithh=string(int(HHSPLITID), "%01.0f")
gen str_mother=string(int(RO10), "%02.0f")
gen str_child=string(int(PERSONID), "%02.0f")
egen IDCHILD=concat(str_psu str_hh str_splithh str_mother str_child)

** TO CHECK IF GENERATED ID IS UNIQUE*
codebook IDCHILD

**********************************************
* CREATING IDCHILD IN THE BIRTH HISTORY FILE *
**********************************************

* IN THE BIRTH HISTORY FILE *
gen str_psu=string(int(IDPSU), "%06.0f")
gen str_hh=string(int(HHID), "%03.0f")
gen str_splithh=string(int(HHSPLITID), "%01.0f")
gen str_mother=string(int(EW3), "%02.0f")
gen str_child=string(int(BH2), "%02.0f")
egen IDCHILD=concat(str_psu str_hh str_splithh str_mother str_child)

** TO CHECK IF GENERATED ID IS UNIQUE *
codebook IDCHILD

*merge 1:1 by IDCHILD*
*keep observations in master and common across the two files i.e. for whom _merge==1 and _merge==3 *
