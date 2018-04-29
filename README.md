# IHDS-creating-new-id
This repository contains the STATA codes needed to create an id variable ‘IDBIRTH’ using data from the India Human Development Survey-II, (IHDS-II), 2011-12. In the survey each individual respondent is uniquely identified using IDPERSON-- a 12-digit unique id.

1.	The ‘birth history’ file contains the records of all the births in each of the households surveyed. The observations can be identified using the following variables.
(a)	BIRTH ID
(b)	HOUSEHOLD ROSTER ID
(c)	HOUSEHOLD ROSTER ID OF MOTHER

2.	The ‘eligible woman’ file contains the responses to the ‘eligible woman’ questionnaire. It contains information on the last live birth since 2005 which can be identified using the BIRTHID. The ‘eligible woman’ file contains the following ids useful in identifying observations.
(a)	HOUSEHOLD ROSTER ID OF MOTHER
(b)	BIRTH ID

3.	The ‘individual’ file contains the anthropometric outcomes for all the individuals in the households surveyed. The observations can be identified using the following ids.
(a)	HOUSEHOLD ROSTER ID
(b)	HOUSEHOLD ROSTER ID OF THE MOTHER

To construct a dataset containing the birth records, information on antenatal and postnatal care, and later life anthropometric outcomes, we need to merge across the three files-birth history, eligible women, and individual file. 
Step 1: Construct a new id ‘IDBIRTH’ containing the HOUSEHOLD ROSTER ID OF THE MOTHER and the BIRTH ID.
Step 2: Merge the ‘birth history’ file with the ‘eligible woman’ file using ‘IDBIRTH’.
Step 3: Construct a new id ‘IDCHILD’ containing the HOUSEHOLD ROSTER ID OF THE MOTHER and the HOUSEHOLD ROSTER ID OF THE CHILD in both the already merged file and the ‘individual’ file.
Step 4: Merge the merged file with the ‘individual’ file using ‘IDCHILD’.
