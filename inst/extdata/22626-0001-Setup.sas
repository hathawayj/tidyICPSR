/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 22626
 |              INDIA HUMAN DEVELOPMENT SURVEY (IHDS), 2005
 |                       (DATASET 0001: INDIVIDUAL)
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\22626-0001-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .; 
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE stateid   1='(1) Jammu & Kashmir 01' 2='(2) Himachal Pradesh 02'
                  3='(3) Punjab 03' 4='(4) Chandigarh 04' 5='(5) Uttaranchal 05'
                  6='(6) Haryana 06' 7='(7) Delhi 07' 8='(8) Rajasthan 08'
                  9='(9) Uttar Pradesh 09' 10='(10) Bihar 10' 11='(11) Sikkim 11'
                  12='(12) Arunachal Pradesh 12' 13='(13) Nagaland 13' 14='(14) Manipur 14'
                  15='(15) Mizoram 15' 16='(16) Tripura 16' 17='(17) Meghalaya 17'
                  18='(18) Assam 18' 19='(19) West Bengal 19' 20='(20) Jharkhand 20'
                  21='(21) Orissa 21' 22='(22) Chhatishgarh 22' 23='(23) Madhya Pradesh 23'
                  24='(24) Gujarat 24' 25='(25) Daman & Diu 25'
                  26='(26) Dadra+Nagar Haveli 26' 27='(27) Maharashtra 27'
                  28='(28) Andhra Pradesh 28' 29='(29) Karnataka 29' 30='(30) Goa 30'
                  31='(31) Lakshadweep 31' 32='(32) Kerala 32' 33='(33) Tamil Nadu 33'
                  34='(34) Pondicherry 34' ;
  VALUE stateidf  101='(101) Jammu & Kashmir 01' 102='(102) Himachal Pradesh 02'
                  105='(105) Uttarakhand 05' 203='(203) Punjab 03' 206='(206) Haryana 06'
                  207='(207) Delhi 07' 309='(309) Uttar Pradesh 09' 310='(310) Bihar 10'
                  320='(320) Jharkhand 20' 408='(408) Rajasthan 08' 422='(422) Chhattisgarh 22'
                  423='(423) Madhya Pradesh 23' 517='(517) Northeast 17' 518='(518) Assam 18'
                  519='(519) West Bengal 19' 521='(521) Orissa 21' 624='(624) Gujarat 24'
                  627='(627) Maharashtra, Goa 27' 728='(728) Andhra Pradesh 28'
                  729='(729) Karnataka 29' 732='(732) Kerala 32' 733='(733) Tamil Nadu 33' ;
  VALUE distname  102='(102) Baramula' 103='(103) Srinagar' 105='(105) Pulwama' 112='(112) Rajauri'
                  113='(113) Jammu' 201='(201) Chamba' 202='(202) Kangra' 204='(204) Kullu'
                  205='(205) Mandi' 206='(206) Hamirpur' 208='(208) Bilaspur' 209='(209) Solan'
                  210='(210) Sirmaur' 211='(211) Shimla' 301='(301) Gurdaspur' 302='(302) Amritsar'
                  303='(303) Kapurthala' 304='(304) Jalandhar' 305='(305) Hoshiarpur'
                  306='(306) Nawanshahr' 307='(307) Rupnagar' 308='(308) Fatehgarh'
                  309='(309) Ludhiana' 310='(310) Moga' 311='(311) Firozpur' 316='(316) Sangrur'
                  317='(317) Patiala' 400='(400) Chandigarh' 505='(505) Dehradun'
                  508='(508) Bageshwar' 509='(509) Almora' 511='(511) Nainital'
                  512='(512) Udham Singh Nagar' 513='(513) Hardwar' 601='(601) Panchkula'
                  602='(602) Ambala' 603='(603) Yamunanagar' 604='(604) Kurukshetra'
                  605='(605) Kaithal' 606='(606) Karnal' 608='(608) Sonipat' 609='(609) Jind'
                  610='(610) Fatehabad' 612='(612) Hissar' 613='(613) Bhiwani' 617='(617) Rewari'
                  618='(618) Gurgaon' 619='(619) Faridabad' 701='(701) North West' 702='(702) North'
                  703='(703) North East' 704='(704) East' 707='(707) West' 708='(708) South West'
                  709='(709) South' 710='(710) Delhi Municipal Corp'
                  711='(711) New Delhi Municipal C' 712='(712) Kirari Suleman Nagar'
                  803='(803) Bikaner' 804='(804) Churu' 805='(805) Jhunjhunu' 806='(806) Alwar'
                  807='(807) Bharatpur' 808='(808) Dhaulpur' 809='(809) Karauli'
                  810='(810) Sawai Madhopur' 811='(811) Dausa' 812='(812) Jaipur' 813='(813) Sikar'
                  814='(814) Nagaur' 815='(815) Jodhpur' 818='(818) Jalor' 820='(820) Pali'
                  821='(821) Ajmer' 824='(824) Bhilwara' 825='(825) Rajsamand' 826='(826) Udaipur'
                  829='(829) Chittaurgarh' 830='(830) Kota' 831='(831) Baran' 832='(832) Jhalawar'
                  901='(901) Saharanpur' 902='(902) Muzaffarnagar' 903='(903) Bijnor'
                  904='(904) Moradabad' 905='(905) Rampur' 906='(906) Jyotiva Phule Nagar'
                  907='(907) Meerut' 909='(909) Ghaziabad' 910='(910) Gautam Buddha Nagar'
                  913='(913) Hathras' 914='(914) Mathura' 915='(915) Agra' 919='(919) Budaun'
                  920='(920) Bareilly' 923='(923) Kheri' 924='(924) Sitapur' 928='(928) Lucknow'
                  929='(929) Farrukabad' 930='(930) Kannauj' 933='(933) Kanpur Dehat'
                  934='(934) Kanpur Nagar' 936='(936) Jhansi' 940='(940) Banda'
                  941='(941) Chitrakoot' 942='(942) Fatehpur' 944='(944) Kaushambi'
                  945='(945) Allahabad' 946='(946) Barabanki' 947='(947) Faizabad'
                  948='(948) Ambedkar Nagar' 949='(949) Sultanpur' 950='(950) Bahraich'
                  951='(951) Sharawasti' 954='(954) Siddharathnagar' 958='(958) Gorakhpur'
                  959='(959) Kushinagar' 960='(960) Deoria' 962='(962) Mau' 963='(963) Baliya'
                  965='(965) Ghazipur' 966='(966) Chandauli' 967='(967) Varanasi'
                  968='(968) Sant Ravidas Nagar' 1002='(1002) Purbi Champaran'
                  1005='(1005) Madhubani' 1006='(1006) Supaul' 1009='(1009) Purnia' 1012='(1012) Saharsa'
                  1014='(1014) Muzaffar Pur' 1016='(1016) Siwan' 1017='(1017) Saran'
                  1022='(1022) Bhagal Pur' 1023='(1023) Banka' 1026='(1026) Sheikhpura'
                  1027='(1027) Nalanda' 1028='(1028) Patna' 1030='(1030) Buxar'
                  1031='(1031) Kaimur (Bhabua)' 1032='(1032) Rohtas' 1035='(1035) Gaya'
                  1100='(1100) Sikkim' 1200='(1200) Arunachal' 1300='(1300) Nagaland'
                  1400='(1400) Manipur' 1500='(1500) Mizoram' 1600='(1600) Tripura'
                  1700='(1700) Meghalaya' 1802='(1802) Dhubri' 1803='(1803) Goalpara'
                  1806='(1806) Kamrup' 1809='(1809) Marigaon' 1814='(1814) Tinsukia' 1817='(1817) Jorhat'
                  1819='(1819) Karbi Amglong' 1821='(1821) Cachar' 1901='(1901) Darjiling'
                  1902='(1902) Jalapiguri' 1904='(1904) Uttar Dinajpur' 1906='(1906) Maldah'
                  1907='(1907) Murshidabad' 1908='(1908) Birbhum' 1909='(1909) Barddhaman'
                  1910='(1910) Nadia' 1911='(1911) North 24 Parganas' 1912='(1912) Hugli'
                  1913='(1913) Bankura' 1916='(1916) Haora' 1917='(1917) Kolkata'
                  1918='(1918) South 24 Parganas' 2002='(2002) Palamu' 2012='(2012) Dhanbad'
                  2013='(2013) Bokaro' 2014='(2014) Ranchi' 2017='(2017) Pashchimi Singbhum'
                  2018='(2018) Purbi Singhbhum' 2101='(2101) Bargarh' 2102='(2102) Jharsuguda'
                  2103='(2103) Sambalpur' 2105='(2105) Sundargarh' 2106='(2106) Kendujhar'
                  2107='(2107) Mayurbhanj' 2108='(2108) Baleshwar' 2109='(2109) Bhadrak'
                  2112='(2112) Cuttack' 2113='(2113) Jajapur' 2114='(2114) Dhenkanal'
                  2115='(2115) Anugul' 2116='(2116) Nayagarh' 2117='(2117) Khordha' 2118='(2118) Puri'
                  2119='(2119) Ganjam' 2120='(2120) Gajapati' 2121='(2121) Kandhamal' 2122='(2122) Baudh'
                  2123='(2123) Sonapur' 2124='(2124) Balangir' 2126='(2126) Kalahandi'
                  2127='(2127) Rayagada' 2128='(2128) Nabarangapur' 2129='(2129) Koraput'
                  2130='(2130) Malkangiri' 2201='(2201) Koriya' 2202='(2202) Sarguja'
                  2203='(2203) Jashpur' 2204='(2204) Raigarh' 2205='(2205) Korba' 2206='(2206) Janjgir'
                  2207='(2207) Bilas Pur' 2208='(2208) Kawardha' 2209='(2209) Rajnandgaon'
                  2210='(2210) Durg' 2211='(2211) Raipur' 2212='(2212) Mahasamund' 2213='(2213) Dhamtari'
                  2214='(2214) Kanker' 2215='(2215) Bastar' 2301='(2301) Sheopur' 2302='(2302) Morena'
                  2304='(2304) Gwalior' 2305='(2305) Datia' 2308='(2308) Tikamgarh'
                  2309='(2309) Chhatarpur' 2310='(2310) Panna' 2312='(2312) Damoh' 2313='(2313) Satna'
                  2315='(2315) Umaria' 2316='(2316) Shahdol' 2317='(2317) Sidhi' 2320='(2320) Ratlam'
                  2321='(2321) Ujjain' 2322='(2322) Shajapur' 2323='(2323) Dewas' 2325='(2325) Dhar'
                  2326='(2326) Indore' 2327='(2327) West Nimar' 2328='(2328) Barwani'
                  2329='(2329) East Nimar' 2330='(2330) Rajgarh' 2332='(2332) Bhopal' 2335='(2335) Betul'
                  2336='(2336) Harda' 2337='(2337) Hoshangabad' 2338='(2338) Katni'
                  2339='(2339) Jabalpur' 2341='(2341) Dindori' 2342='(2342) Mandla' 2344='(2344) Seoni'
                  2401='(2401) Kachchh' 2403='(2403) Patan' 2404='(2404) Mahesana'
                  2406='(2406) Gandhinagar' 2407='(2407) Ahmedabad' 2408='(2408) Surendranagar'
                  2409='(2409) Rajkot' 2410='(2410) Jamnagar' 2412='(2412) Junagadh' 2413='(2413) Amreli'
                  2414='(2414) Bhavnagar' 2415='(2415) Anand' 2416='(2416) Kheda' 2419='(2419) Vadodara'
                  2420='(2420) Narmada' 2421='(2421) Bharuch' 2422='(2422) Surat'
                  2500='(2500) Daman & Diu' 2600='(2600) Dadra & Nagar Haveli'
                  2701='(2701) Nandurbar' 2702='(2702) Dhule' 2703='(2703) Jalgaon' 2705='(2705) Akola'
                  2706='(2706) Washim' 2707='(2707) Amarawti' 2708='(2708) Wardha' 2709='(2709) Nagpur'
                  2710='(2710) Bhandara' 2711='(2711) Gondiya' 2713='(2713) Chandrapur'
                  2714='(2714) Yavatmal' 2715='(2715) Nanded' 2716='(2716) Hingoli'
                  2717='(2717) Parbhani' 2718='(2718) Jalna' 2720='(2720) Nasik' 2721='(2721) Thane'
                  2723='(2723) Mumbai' 2725='(2725) Pune' 2726='(2726) Ahmadnagar' 2727='(2727) Bid'
                  2729='(2729) Osmanabad' 2730='(2730) Solapur' 2731='(2731) Satara'
                  2732='(2732) Ratnagiri' 2734='(2734) Kolhapur' 2801='(2801) Adilabad'
                  2802='(2802) Nizamabad' 2803='(2803) Karimnagar' 2804='(2804) Medak'
                  2805='(2805) Hyderabad' 2806='(2806) Rangareddi' 2807='(2807) Mahbubnagar'
                  2810='(2810) Khammam' 2813='(2813) Visakhapatnam' 2814='(2814) East Godavari'
                  2815='(2815) West Godavari' 2816='(2816) Krishna' 2817='(2817) Guntur'
                  2818='(2818) Prakasam' 2819='(2819) Nellore' 2820='(2820) Cuddapah'
                  2821='(2821) Kurnool' 2822='(2822) Anantapur' 2823='(2823) Chittoor'
                  2901='(2901) Belgaum' 2902='(2902) Bagalkot' 2903='(2903) Bijapur' 2905='(2905) Bidar'
                  2906='(2906) Raichur' 2907='(2907) Koppal' 2908='(2908) Gadag' 2909='(2909) Dharwad'
                  2910='(2910) Uttar Kannad' 2911='(2911) Haveri' 2912='(2912) Bellary'
                  2913='(2913) Chitradurga' 2914='(2914) Davanagere' 2915='(2915) Shimoga'
                  2916='(2916) Udupi' 2917='(2917) Chikmagalur' 2918='(2918) Tumkur' 2919='(2919) Kolar'
                  2920='(2920) Bangalore' 2921='(2921) Bangalore Rural' 2922='(2922) Mandya'
                  2924='(2924) Dakshin Kannada' 2925='(2925) Kodagu' 2926='(2926) Mysore'
                  2927='(2927) Chamarajanagar' 3001='(3001) North Goa' 3002='(3002) South Goa'
                  3202='(3202) Kannur' 3204='(3204) Kozhikode' 3205='(3205) Malappuram'
                  3206='(3206) Palakkad' 3207='(3207) Thrissur' 3208='(3208) Ernakulam'
                  3209='(3209) Idukki' 3210='(3210) Kottayam' 3211='(3211) Alappuzha'
                  3212='(3212) Pathanamthitta' 3213='(3213) Kollam'
                  3214='(3214) Thiruvananthapuram' 3301='(3301) Thiruvallur' 3302='(3302) Chennai'
                  3303='(3303) Kancheepuram' 3304='(3304) Vellore' 3305='(3305) Dharampuri'
                  3306='(3306) Tiruvannamalai' 3309='(3309) Namakkal' 3310='(3310) Erode'
                  3312='(3312) Coimbatore' 3313='(3313) Dindigul' 3314='(3314) Karur'
                  3315='(3315) Tiruchchirappalli' 3316='(3316) Perambalur' 3317='(3317) Ariyalur'
                  3323='(3323) Sivaganga' 3324='(3324) Madurai' 3325='(3325) Theni'
                  3327='(3327) Ramanathapuram' 3328='(3328) Thoothukkudi'
                  3329='(3329) Tirunelveli' 3330='(3330) Kanniyakumari' 3400='(3400) Pondicherry'
                  4902='(4902) Fatehpur' ;
  VALUE urban     0='(0) Rural' 1='(1) Urban' ;
  VALUE metro6ff  1='(1) Mumbai' 2='(2) Delhi' 3='(3) Kolkata' 4='(4) Chennai' 5='(5) Bangalore'
                  6='(6) Hyderabad' ;
  VALUE copc      -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE groups8f  1='(1) Brahmin' 2='(2) High caste' 3='(3) OBC' 4='(4) Dalit' 5='(5) Adivasi'
                  6='(6) Muslim' 7='(7) Sikh, Jain' 8='(8) Christian' ;
  VALUE hc9fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE hhassets  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE hhed5adf  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) None' 1='(1) 1' 2='(2) 2' 3='(3) 3' 4='(4) 4'
                  5='(5) 5th standard' 6='(6) 6' 7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Matric'
                  11='(11) 11' 12='(12) Higher sec' 13='(13) 13' 14='(14) 14' 15='(15) Graduate' ;
  VALUE hhed5f    -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) None' 1='(1) 1' 2='(2) 2' 3='(3) 3' 4='(4) 4'
                  5='(5) 5th standard' 6='(6) 6' 7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Matric'
                  11='(11) 11' 12='(12) Higher sec' 13='(13) 13' 14='(14) 14' 15='(15) Graduate' ;
  VALUE hhed5m    -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) None' 1='(1) 1' 2='(2) 2' 3='(3) 3' 4='(4) 4'
                  5='(5) 5th standard' 6='(6) 6' 7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Matric'
                  11='(11) 11' 12='(12) Higher sec' 13='(13) 13' 14='(14) 14' 15='(15) Graduate' ;
  VALUE wkany     0='(0) < 240hrs' 1='(1) >= 240hrs' ;
  VALUE wkfarm    0='(0) < 240hrs' 1='(1) >= 240hrs' ;
  VALUE wkanimal  0='(0) < 240hrs' 1='(1) >= 240hrs' ;
  VALUE wkagwage  0='(0) < 240hrs' 1='(1) >= 240hrs' ;
  VALUE wknonag   0='(0) < 240hrs' 1='(1) >= 240hrs' ;
  VALUE wksalary  0='(0) < 240hrs' 1='(1) >= 240hrs' ;
  VALUE wkbusinf  0='(0) < 240hrs' 1='(1) >= 240hrs' ;
  VALUE poor      0='(0) No' 1='(1) Yes' ;
  VALUE ro1fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ro3fffff  1='(1) Male' 2='(2) Female' ;
  VALUE ro4fffff  1='(1) Head' 2='(2) Wife/husband' 3='(3) Son/daughter' 4='(4) Child-in-law'
                  5='(5) Grandchild' 6='(6) Father/mother' 7='(7) Brother/sister'
                  8='(8) Parent in-law' 9='(9) Nephew/niece' 10='(10) Sibling in-law'
                  11='(11) Other relative' 12='(12) Servant/other' ;
  VALUE ro5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ro6fffff  0='(0) Sp absent' 1='(1) Married' 2='(2) Single' 3='(3) Widowed'
                  4='(4) Sep/div' 5='(5) No gauna' ;
  VALUE ro7fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ro8fffff  93='(93) Deceased' 94='(94) Separated' ;
  VALUE ro9fffff  93='(93) Deceased' 94='(94) Separated' ;
  VALUE fm28ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE fm29ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE fm30ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE fm31ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE an5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE an6fffff  1='(1) Never' 2='(2) Sometimes' 3='(3) Usually' ;
  VALUE ws6year   -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws8annuf  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws8hourf  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws10ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws1fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws3a      -4='(-4) Invalid skip' -3='(-3) Don''t know' 0='(0) Physical scientists'
                  1='(1) Physical sci tech' 2='(2) Engineers' 3='(3) Eng. tech'
                  4='(4) Air/ship officers' 5='(5) Life scientists'
                  6='(6) Life science tech' 7='(7) Physicians' 8='(8) Nursing'
                  9='(9) Other scientific' 10='(10) Statisticians' 11='(11) Economists'
                  12='(12) Accountants' 13='(13) Social scientists' 14='(14) Lawyers'
                  15='(15) Teachers' 16='(16) Journalists' 17='(17) Artists' 18='(18) Performers'
                  19='(19) Professional nec' 20='(20) Elected officials'
                  21='(21) Govt officials' 22='(22) Mgr Whsl/retail' 23='(23) Mgr finance'
                  24='(24) Mgr manf' 25='(25) Mgr transp/commun' 26='(26) Mgr service'
                  29='(29) Managerial nec' 30='(30) Clerical supe'
                  31='(31) Village officials' 32='(32) Typists' 33='(33) Book-keepers'
                  34='(34) Computing op' 35='(35) Clerical nec' 36='(36) Transp/commun supe'
                  37='(37) Transp conductors' 38='(38) Mail distributors'
                  39='(39) Telephone op' 40='(40) Shopkeepers' 41='(41) Manuf agents'
                  42='(42) Technical sales' 43='(43) Sales, shop' 44='(44) FIRE sales'
                  45='(45) Money lenders' 49='(49) Sales, nec' 50='(50) Hotel/restaurant'
                  51='(51) House keepers' 52='(52) Cooks/waiters' 53='(53) Maids'
                  54='(54) Sweepers' 55='(55) Launderers' 56='(56) Barbers' 57='(57) Police'
                  59='(59) Service nec' 60='(60) Farm manager' 61='(61) Cultivators'
                  62='(62) Other farmers' 63='(63) Ag labour' 64='(64) Plantation lab'
                  65='(65) Other farm' 66='(66) Forestry' 67='(67) Hunters' 68='(68) Fishermen'
                  71='(71) Miners' 72='(72) Metal workers' 73='(73) Wood/paper'
                  74='(74) Chemical' 75='(75) Textile' 76='(76) Tanners' 77='(77) Food'
                  78='(78) Tobacco' 79='(79) Tailors' 80='(80) Shoe makers' 81='(81) Carpenters'
                  82='(82) Stone cutters' 83='(83) Machine tool op' 84='(84) Assemblers'
                  85='(85) Electrical' 86='(86) Cinema op' 87='(87) Plumbers/welders'
                  88='(88) Jewellery' 89='(89) Potters' 90='(90) Rubber/plastic' 91='(91) Paper'
                  92='(92) Printing' 93='(93) Painters' 94='(94) Production nec'
                  95='(95) Construction' 96='(96) Boilermen' 97='(97) Loaders' 98='(98) Drivers'
                  99='(99) Labour nec' ;
  VALUE ws4a      -6='(-6) Out of range' -5='(-5) Valid skip' -4='(-4) Invalid skip'
                  0='(0) Agriculture' 1='(1) Plantations' 2='(2) Livestock'
                  3='(3) Ag services' 4='(4) Hunting' 5='(5) Forestry' 6='(6) Fishing'
                  10='(10) Coal mining' 11='(11) Petroleum extract' 12='(12) Iron mining'
                  13='(13) Other metal mining' 14='(14) Uranium mining'
                  15='(15) Nonmetal mining' 19='(19) Mining services'
                  20='(20) Manf food products' 22='(22) Manf bev/tobacco'
                  23='(23) Manf cotton textiles' 24='(24) Manf wool/silk/etc'
                  25='(25) Manf jute' 26='(26) Manf apparel' 27='(27) Manf wood/furniture'
                  28='(28) Manf paper/publish' 29='(29) Manf leather'
                  30='(30) Manf chemicals' 31='(31) Manf rubber/plastic'
                  32='(32) Manf mineral' 33='(33) Manf basic metal'
                  34='(34) Manf metal products' 35='(35) Manf machinery'
                  37='(37) Manf transport equip' 38='(38) Manf other'
                  39='(39) Repair capital goods' 40='(40) Electricity' 41='(41) Gas/steam'
                  42='(42) Water works' 43='(43) Other energy' 50='(50) Construction'
                  51='(51) Allied construction' 60='(60) Whsl ag/textiles'
                  61='(61) Whsl basic goods' 62='(62) Whsl machinery' 63='(63) Whsl nec'
                  64='(64) Manf agents' 65='(65) Retail food' 66='(66) Retail textiles'
                  67='(67) Retail household' 68='(68) Retail nec'
                  69='(69) Restaurants/hotels' 70='(70) Land transport'
                  71='(71) Water transport' 72='(72) Air transport' 73='(73) Transport nec'
                  74='(74) Storage' 75='(75) Communication' 80='(80) Banking' 81='(81) Insurance'
                  82='(82) Real estate' 83='(83) Legal' 84='(84) Lotteries' 85='(85) Renting'
                  89='(89) Business services' 90='(90) Public admin' 91='(91) Sanitary'
                  92='(92) Education' 93='(93) Medical' 94='(94) Community' 95='(95) Rec/culture'
                  96='(96) Personal services' 97='(97) Repair services'
                  98='(98) International' 99='(99) Services nec' ;
  VALUE ws5a      -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws6a      -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws6yeara  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws7a      -5='(-5) Valid skip' -4='(-4) Invalid skip' 1='(1) Per Day' 2='(2) Per Month'
                  3='(3) Per Year' ;
  VALUE ws8a      -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws8ann0f  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws8hou0f  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws9a      -4='(-4) Invalid skip' 0='(0) No' 1='(1) Yes meal' 2='(2) Yes hse'
                  3='(3) Yes both' ;
  VALUE ws10a     -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ws11a     -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Casual' 2='(2) Perm' ;
  VALUE ws12a     -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Regular govt' 2='(2) Sgry'
                  3='(3) Food for work' 4='(4) Other govt' ;
  VALUE nf7fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf8fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf9fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf16ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf17ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf18ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf25ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf26ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE nf27ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in7fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in7r      -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in8fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in8r      -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in9fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in9r      -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in10ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in10r     -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in11ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in11r     -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in12ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in12r     -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in13ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE in13r     -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ed1fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ed2fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE ed3fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE ed4fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE ed5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) None' 1='(1) 1' 2='(2) 2' 3='(3) 3' 4='(4) 4'
                  5='(5) 5th standard' 6='(6) 6' 7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Matric'
                  11='(11) 11' 12='(12) Higher sec' 13='(13) 13' 14='(14) 14' 15='(15) Graduate' ;
  VALUE ed6fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE ed7fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes, little' 2='(2) Yes, fluent' ;
  VALUE ed8fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE ed9fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) I' 2='(2) II' 3='(3) III' ;
  VALUE ed10ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Science' 2='(2) Arts' 3='(3) Commerce'
                  4='(4) Vocational' 5='(5) Others' ;
  VALUE ed11ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) College' 2='(2) Technical' ;
  VALUE ed12ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) None' 1='(1) Bachelors' 2='(2) Master''s'
                  3='(3) Professional' 4='(4) Vocational' 5='(5) Others' ;
  VALUE ed13ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) I' 2='(2) II' 3='(3) III' ;
  VALUE cs2fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs3fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) EGS' 2='(2) Government' 3='(3) Govt Aided'
                  4='(4) Private' 5='(5) Convent' 6='(6) Madrassa' 7='(7) Other/ open'
                  8='(8) Junior college' 9='(9) College' 10='(10) Post graduate'
                  11='(11) Tech voc <1yr' 12='(12) Tech voc long' ;
  VALUE cs4fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) None' 1='(1) 1' 2='(2) 2' 3='(3) 3' 4='(4) 4'
                  5='(5) 5th standard' 6='(6) 6' 7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Matric'
                  11='(11) 11' 12='(12) Higher sec' 13='(13) 13' 14='(14) 14' 15='(15) Graduate' ;
  VALUE cs6fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Hindi' 2='(2) State lang' 3='(3) English'
                  4='(4) Other' ;
  VALUE cs7fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs8fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs9fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs10ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs11ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs12ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes, Grain' 3='(3) Yes, Dalia'
                  4='(4) Yes, variety' ;
  VALUE cs14ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE cs15ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE cs16ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE cs17ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE cs18ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs19ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE cs20ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE sm1fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE sm2fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE sm3fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm4fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm6fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm7fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm8fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) More' 2='(2) Same' 3='(3) Less' ;
  VALUE sm9fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm10ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE sm11ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm13a1ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Public Doctor/ Nurse'
                  2='(2) Public Dr./ Nurse in private' 3='(3) Private Dr/Nurse'
                  4='(4) Pharmacy' 5='(5) Other (traditional healer)' ;
  VALUE sm14a1ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Same village/neighbourhood'
                  2='(2) Another village/neighbourhood' 3='(3) Other town'
                  4='(4) District town' ;
  VALUE sm13a2ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Public Doctor/ Nurse'
                  2='(2) Public Dr./ Nurse in private' 3='(3) Private Dr/Nurse'
                  4='(4) Pharmacy' 5='(5) Other (traditional healer)' ;
  VALUE sm14a2ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Same village/neighbourhood'
                  2='(2) Another village/neighbourhood' 3='(3) Other town'
                  4='(4) District town' ;
  VALUE sm15ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE sm16ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE sm17ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE sm18ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE sm19ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE mb1fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE mb2fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb3fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb4fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb6fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb7fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb8fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb9fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb10ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb11ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb12ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb13ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb14ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb15ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb16ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE mb17ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' 2='(2) Cured' ;
  VALUE mb19_1ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Public Doctor/ Nurse'
                  2='(2) Public Dr./ Nurse in private' 3='(3) Private Dr/Nurse'
                  4='(4) Pharmacy' 5='(5) Other (traditional healer)' ;
  VALUE mb20_1ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Same village/neighbourhood'
                  2='(2) Another village/neighbourhood' 3='(3) Other town'
                  4='(4) District town' ;
  VALUE mb19_2ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Public Doctor/ Nurse'
                  2='(2) Public Dr./ Nurse in private' 3='(3) Private Dr/Nurse'
                  4='(4) Pharmacy' 5='(5) Other (traditional healer)' ;
  VALUE mb20_2ff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Same village/neighbourhood'
                  2='(2) Another village/neighbourhood' 3='(3) Other town'
                  4='(4) District town' ;
  VALUE mb21ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE mb22ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE mb23ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE mb24ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE mb25ffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ad1fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ad2fffff  -1='(-1) Valid blank' 0='(0) No difficulty' 1='(1) With difficulty'
                  2='(2) Unable to do' ;
  VALUE ad3fffff  -1='(-1) Valid blank' 0='(0) No difficulty' 1='(1) With difficulty'
                  2='(2) Unable to do' ;
  VALUE ad4fffff  -1='(-1) Valid blank' 0='(0) No difficulty' 1='(1) With difficulty'
                  2='(2) Unable to do' ;
  VALUE ad5fffff  -1='(-1) Valid blank' 0='(0) No difficulty' 1='(1) With difficulty'
                  2='(2) Unable to do' ;
  VALUE ad6fffff  -1='(-1) Valid blank' 0='(0) No difficulty' 1='(1) With difficulty'
                  2='(2) Unable to do' ;
  VALUE ad7fffff  -1='(-1) Valid blank' 0='(0) No difficulty' 1='(1) With difficulty'
                  2='(2) Unable to do' ;
  VALUE ad8fffff  -1='(-1) Valid blank' 0='(0) No difficulty' 1='(1) With difficulty'
                  2='(2) Unable to do' ;
  VALUE to2fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) Never' 1='(1) Sometimes' 2='(2) Daily' ;
  VALUE to3fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) Never' 1='(1) Sometimes' 2='(2) Daily' ;
  VALUE to4fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) Never' 1='(1) Sometimes' 2='(2) Daily' ;
  VALUE ap1fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ap2fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ap3fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Lying' 2='(2) Standing' ;
  VALUE ap4fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ap5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ta2fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ta3fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes, currently'
                  2='(2) Yes, in the past' ;
  VALUE ta4fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' ;
  VALUE ta5fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) No' 1='(1) Yes' ;
  VALUE ta6fffff  -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Nicely' 2='(2) Somewhat nicely'
                  3='(3) Not nicely' ;
  VALUE ta7lang   -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Hindi' 2='(2) Assamese' 3='(3) Bangla'
                  4='(4) Gujarathi' 5='(5) Marathi' 6='(6) Oriya' 7='(7) Kannad' 8='(8) Malyalam'
                  9='(9) Tamil Nadu' 10='(10) Telegu' 11='(11) English' 12='(12) Punjabi'
                  13='(13) Urdu' ;
  VALUE ta7lvl    -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) Can not read' 1='(1) Letter' 2='(2) Word'
                  3='(3) Paragarph' 4='(4) Story' ;
  VALUE ta8lang   -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Hindi' 2='(2) Assamese' 3='(3) Bangla'
                  4='(4) Gujarathi' 5='(5) Marathi' 6='(6) Oriya' 7='(7) Kannad' 8='(8) Malyalam'
                  9='(9) Tamil Nadu' 10='(10) Telegu' 11='(11) English' 12='(12) Punjabi'
                  13='(13) Urdu' ;
  VALUE ta8lvl    -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) Can not' 1='(1) Number' 2='(2) Subtraction'
                  3='(3) Division' ;
  VALUE ta9lang   -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 1='(1) Hindi' 2='(2) Assamese' 3='(3) Bangla'
                  4='(4) Gujarathi' 5='(5) Marathi' 6='(6) Oriya' 7='(7) Kannad' 8='(8) Malyalam'
                  9='(9) Tamil Nadu' 10='(10) Telegu' 11='(11) English' 12='(12) Punjabi'
                  13='(13) Urdu' ;
  VALUE ta9lvl    -7='(-7) Inconsistent' -6='(-6) Out of range' -5='(-5) Valid skip'
                  -4='(-4) Invalid skip' -3='(-3) Don''t know' -2='(-2) Valid skip'
                  -1='(-1) Valid blank' 0='(0) Can not'
                  1='(1) Writes with 2 or less mistakes' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=643;
INPUT
        CASEID $13-23           STATEID 1-2             DISTID 3-4
        PSUID 5-6               HHID 7-8                HHSPLITID 9-10
        PERSONID 11-12          IDHH 24-32              IDPSU 33-38
        STATEID2 39-41          DISTNAME 42-45          DIST01 46-47
        URBAN 48-49             METRO6 50-51            SWEIGHT 52-60 .2
        NPERSONS 61-62          NCHILDREN 63-64         NTEENS 65-66
        NADULTS 67-68           NMARRIEDF 69-70         NMARRIEDM 71-72
        COPC 73-77              GROUPS8 78-79           HC9 80-81
        HHASSETS 82-83          HHED5ADULT 84-85        HHED5F 86-87
        HHED5M 88-89            WKANY 90-91             WKFARM 92-93
        WKANIMAL 94-95          WKAGWAGE 96-97          WKNONAG 98-99
        WKSALARY 100-101        WKBUSINESS 102-103      INCOME 104-114 .2
        INCFARM 115-125 .2      INCAGWAGE 126-134 .2    INCNONAG 135-143 .2
        INCSALARY 144-152 .2    INCBUS 153-159          INCREMIT 160-165
        INCGOVT 166-171         INCOTHER 172-177        PCPL 178-183 .2
        POOR 184-185            RO0 186-187             RO1 188-189
        RO3 190-191             RO4 192-193             RO5 194-196
        RO6 197-198             RO7 199-200             RO8 201-202
        RO9 203-204             FM28 205-206            FM29 207-209
        FM30 210-211            FM31 212-213            AN5 214-215
        AN6 216-217             AN7 218-219             WS0N 220-221
        WS6YEAR 222-225         WS8ANNUAL 226-231       WS8HOURLY 232-237 .2
        WS10 238-242            WS1 243-244             WS2A $245-274
        WS3A 275-276            WS4A 277-278            WS5A 279-281
        WS6A 282-283            WS6YEARA 284-287        WS7A 288-289
        WS8A 290-294            WS8ANNUALA 295-303 .2   WS8HOURLYA 304-309 .2
        WS9A 310-311            WS10A 312-316           WS11A 317-318
        WS12A 319-320           NF7 321-322             NF8 323-325
        NF9 326-327             NF16 328-329            NF17 330-332
        NF18 333-334            NF25 335-336            NF26 337-339
        NF27 340-341            IN7 342-343             IN7R 344-347
        IN8 348-349             IN8R 350-356 .2         IN9 357-358
        IN9R 359-362            IN10 363-364            IN10R 365-368
        IN11 369-370            IN11R 371-377 .2        IN12 378-379
        IN12R 380-387 .2        IN13 388-389            IN13R 390-393
        ED1 394-395             ED2 396-397             ED3 398-399
        ED4 400-401             ED5 402-403             ED6 404-405
        ED7 406-407             ED8 408-409             ED9 410-411
        ED10 412-413            ED11 414-415            ED12 416-417
        ED13 418-419            MM6 420-421             CS2 422-423
        CS3 424-425             CS4 426-427             CS5 428-429
        CS6 430-431             CS7 432-433             CS8 434-435
        CS9 436-437             CS10 438-439            CS11 440-441
        CS12 442-443            CS14 444-445            CS15 446-447
        CS16 448-449            CS17 450-451            CS18 452-456
        CS19 457-461            CS20 462-466            SM1 467-468
        SM2 469-470             SM3 471-472             SM4 473-474
        SM5 475-476             SM6 477-478             SM7 479-480
        SM8 481-482             SM9 483-484             SM10 485-486
        SM11 487-488            SM13A1 489-490          SM14A1 491-492
        SM13A2 493-494          SM14A2 495-496          SM15 497-498
        SM16 499-503            SM17 504-505            SM18 506-510
        SM19 511-514            MB1 515-516             MB2 517-518
        MB3 519-520             MB4 521-522             MB5 523-524
        MB6 525-526             MB7 527-528             MB8 529-530
        MB9 531-532             MB10 533-534            MB11 535-536
        MB12 537-538            MB13 539-540            MB14 541-542
        MB15 543-544            MB16 545-547            MB17 548-549
        MB19_1 550-551          MB20_1 552-553          MB19_2 554-555
        MB20_2 556-557          MB21 558-560            MB22 561-566
        MB23 567-568            MB24 569-573            MB25 574-578
        AD1 579-580             AD2 581-582             AD3 583-584
        AD4 585-586             AD5 587-588             AD6 589-590
        AD7 591-592             AD8 593-594             TO1 595-596
        TO2 597-598             TO3 599-600             TO4 601-602
        AP1 603-604             AP2 605-607             AP3 608-609
        AP4 610-615 .2          AP5 616-621 .2          TA2 622-623
        TA3 624-625             TA4 626-627             TA5 628-629
        TA6 630-631             TA7LANG 632-633         TA7LVL 634-635
        TA8LANG 636-637         TA8LVL 638-639          TA9LANG 640-641
        TA9LVL 642-643          ;


* SAS LABEL STATEMENT;

LABEL
   CASEID  = 'HH & Personid: 11 byte string'
   STATEID = 'State code'
   DISTID  = 'District code'
   PSUID   = 'PSU: village/neighborhood code'
   HHID    = 'Household ID'
   HHSPLITID= 'Split household ID'
   PERSONID= 'Person ID within household'
   IDHH    = 'HH ID 9-digit unique'
   IDPSU   = 'PSU ID 6-digit unique'
   STATEID2= 'State codes, collapsed'
   DISTNAME= 'District codes with names'
   DIST01  = 'District ID Census 2001'
   URBAN   = 'Census: 2001 village/town'
   METRO6  = 'Largest 6 metro areas 1-6'
   SWEIGHT = 'Design Weights'
   NPERSONS= 'HH4 2.0 N in hh'
   NCHILDREN= 'HH4 2.5 N 0-14 in hh'
   NTEENS  = 'HH4 2.5 N 15-21 in hh'
   NADULTS = 'HH4 2.5 N 22+ in hh'
   NMARRIEDF= 'HH4 2.6 N married women in hh'
   NMARRIEDM= 'HH4 2.6 N married men in hh'
   COPC    = 'HH19 12. Monthly consumption per capita'
   GROUPS8 = 'HH3 1.13-15 Caste/religion 8cats'
   HC9     = 'HH1 9 Reinterview household'
   HHASSETS= 'HH22+EH 30 hh goods & housing'
   HHED5ADULT= 'HH17 ed5 Highest adult(21+) educ'
   HHED5F  = 'HH17 ed5 Highest female 21+ ed'
   HHED5M  = 'HH17 ed5 Highest male 21+ ed'
   WKANY   = 'HH 4-7 Any work'
   WKFARM  = 'HH9  4.28 Family farm work'
   WKANIMAL= 'HH9  5.5 Animal care'
   WKAGWAGE= 'HH11 6.3 Ag wage labour'
   WKNONAG = 'HH11 6.3 Nonag wage labour'
   WKSALARY= 'HH11 6.,7 Salaried position'
   WKBUSINESS= 'HH12 7.7 Family business work'
   INCOME  = 'HH5-15 3-8 Total income'
   INCFARM = 'HH6-10 4-6 Family farm income'
   INCAGWAGE= 'HH11 6.8+ hh ag wages'
   INCNONAG= 'HH11 6.8+ hh nonag wages'
   INCSALARY= 'HH11 6.8+ hh salaries'
   INCBUS  = 'HH12-14 7. Net business income'
   INCREMIT= 'HH5  3.13 Sum hh remittances'
   INCGOVT = 'HH15 8.7-13 govt benefits'
   INCOTHER= 'HH15 8.1+ property, pensions etc.'
   PCPL    = 'Per capita poverty line'
   POOR    = 'Below poverty line'
   RO0     = 'HH4 2.1 2005 ID'
   RO1     = 'HH4 2.1 1993ID'
   RO3     = 'HH4 2.3 Sex'
   RO4     = 'HH4 2.4 Relationship to head'
   RO5     = 'HH4 2.5 Age'
   RO6     = 'HH4 2.6 Marital Status'
   RO7     = 'HH4 2.7 Spouse''s ID'
   RO8     = 'HH4 2.8 Father''s ID'
   RO9     = 'HH4 2.9 Mother''s ID'
   FM28    = 'HH9 4.28 Farm work ID'
   FM29    = 'HH9 4.29 Farm work days/year'
   FM30    = 'HH9 4.30 Farm work hours/day'
   FM31    = 'HH9 4.31 Farm work Primary'
   AN5     = 'HH10 5.5 Animal care: ID'
   AN6     = 'HH10 5.6 Animal care: Freq'
   AN7     = 'HH10 5.7 Animal care: Primary ID'
   WS0N    = 'HH11 6.1 # of jobs'
   WS6YEAR = 'HH11 6.5-6 Work hrs/yr tot'
   WS8ANNUAL= 'HH11 6.8 Ann earnings tot'
   WS8HOURLY= 'HH11 6.8 hourly wage tot'
   WS10    = 'HH11 6.10 Bonus all jobs'
   WS1     = 'HH11 6.1 personid'
   WS2A    = 'HH11 6.2 Job description job1'
   WS3A    = 'HH11 6.3 Occupation  job1'
   WS4A    = 'HH11 6.4 Industry  job1'
   WS5A    = 'HH11 6.5 Working days job1'
   WS6A    = 'HH11 6.6 Work hrs/day job1'
   WS6YEARA= 'HH11 6.5-6 Work hrs/yr job 1'
   WS7A    = 'HH11 6.7 Payment period job1'
   WS8A    = 'HH11 6.8 Cash /period job1'
   WS8ANNUALA= 'HH11 6.8 Ann earnings job 1'
   WS8HOURLYA= 'HH11 6.8 hourly wage job 1'
   WS9A    = 'HH11 6.9 Meals/housing job1'
   WS10A   = 'HH11 6.10 Bonus job 1'
   WS11A   = 'HH11 6.11 Casual job1'
   WS12A   = 'HH11 6.12 Government job1'
   NF7     = 'HH12 7.7 Busns1'
   NF8     = 'HH12 7.8 Busns1: days/yr'
   NF9     = 'HH12 7.9 Busns1: hours/day'
   NF16    = 'HH13 7.16 Busns2'
   NF17    = 'HH13 7.17 Busns2: days/yr'
   NF18    = 'HH13 7.18 Busns2: hours/day'
   NF25    = 'HH14 7.25 Busns3'
   NF26    = 'HH14 7.26 Busns3: days/yr'
   NF27    = 'HH14 7.27 Busns3: hours/day'
   IN7     = 'HH15 8.7 Old Age Pension ID'
   IN7R    = 'HH15 8.7 Old Age Pension Rs'
   IN8     = 'HH15 8.8 Widows Pension ID'
   IN8R    = 'HH15 8.8 Widows Pension Rs. yr'
   IN9     = 'HH15 8.9 Maternity Benefit ID'
   IN9R    = 'HH15 8.9 Maternity Benefit Rs'
   IN10    = 'HH15 8.10 Disability Pension ID'
   IN10R   = 'HH15 8.10 Disability Pension Rs'
   IN11    = 'HH15 8.11 Annapurna ID'
   IN11R   = 'HH15 8.11 Annapurna Rs'
   IN12    = 'HH15 8.12 Other govt ID'
   IN12R   = 'HH15 8.12 Other govt Rs'
   IN13    = 'HH15 8.13 NGOs ID'
   IN13R   = 'HH15 8.13 NGOs Rs'
   ED1     = 'HH17 10.1 Educ: ID'
   ED2     = 'HH17 10.2 Educ: Literacy'
   ED3     = 'HH17 10.3 Educ: Attended school'
   ED4     = 'HH17 10.4 Educ: Enrolled now'
   ED5     = 'HH17 10.5 Educ: Completed Years'
   ED6     = 'HH17 10.6 Educ: Ever repeated'
   ED7     = 'HH17 10.7 Educ: English ability'
   ED8     = 'HH17 10.8 Educ: NFEP ever'
   ED9     = 'HH17 10.9 Educ: 2ndary class'
   ED10    = 'HH17 10.10 Educ: Post 2nd subj'
   ED11    = 'HH17 10.11 Educ: College/voc'
   ED12    = 'HH17 10.12 Educ: Highest degree'
   ED13    = 'HH17 10.13 Educ: Degree class'
   MM6     = 'HH18 11.6 Knows computers'
   CS2     = 'EH4 2.2 ID Code'
   CS3     = 'EH4 2.3 School type'
   CS4     = 'EH4 2.4 School distance (Km)'
   CS5     = 'EH4 2.5 Standard (yrs)'
   CS6     = 'EH4 2.6 Medium of instruction'
   CS7     = 'EH4 2.7 Year English taught'
   CS8     = 'EH4 2.8 School Hrs/week'
   CS9     = 'EH4 2.9 Homework Hrs/week'
   CS10    = 'EH4 2.10 Pvt Tuition Hrs/week'
   CS11    = 'EH4 2.11 Days/month absent'
   CS12    = 'EH4 2.12 Mid-day meal'
   CS14    = 'EH4 2.14 Free books'
   CS15    = 'EH4 2.15 Free uniform'
   CS16    = 'EH4 2.16 School fees by govt'
   CS17    = 'EH4 2.17 Scholarship'
   CS18    = 'EH4 2.18 School fees'
   CS19    = 'EH4 2.19 Books uniform bus Rs'
   CS20    = 'EH4 2.20 Pvt tuition Rs'
   SM1     = 'EH12 8.1a STMorb ID'
   SM2     = 'EH12 8.2a STMorb Days ill'
   SM3     = 'EH12 8.3a Fever'
   SM4     = 'EH12 8.4a Cough'
   SM5     = 'EH12 8.5a Cough w short breaths'
   SM6     = 'EH12 8.6a Diarrhoea'
   SM7     = 'EH12 8.7a Diarrhoea with blood'
   SM8     = 'EH12 8.8a Liquid intake if Diarrhoea'
   SM9     = 'EH12 8.9a ORS given if Diarrhoea'
   SM10    = 'EH12 8.10a STMorb Days Unable'
   SM11    = 'EH12 8.11a STMorb Treatment'
   SM13A1  = 'EH13 8.13a1 STMorb Who 1st treat'
   SM14A1  = 'EH13 8.14a1 STMorb Where 1st treat'
   SM13A2  = 'EH13 8.13a2 STMorb Who 2nd treat'
   SM14A2  = 'EH13 8.14a2 STMorb Where 2nd treat'
   SM15    = 'EH13 8.15a STMorb Days hosp'
   SM16    = 'EH13 8.16a STMorb Dr/hosp Rs'
   SM17    = 'EH13 8.17a STMorb Meds in cost'
   SM18    = 'EH13 8.18a STMorb Medicine Rs'
   SM19    = 'EH13 8.19a STMorb Travel Rs'
   MB1     = 'EH14 9.1 MJmorb ID'
   MB2     = 'EH14 9.2 Cataract'
   MB3     = 'EH14 9.3 Tuberculosis'
   MB4     = 'EH14 9.4 High BP'
   MB5     = 'EH14 9.5 Heart disease'
   MB6     = 'EH14 9.6 Diabetes'
   MB7     = 'EH14 9.7 Leprosy'
   MB8     = 'EH14 9.8 Cancer'
   MB9     = 'EH14 9.9 Asthma'
   MB10    = 'EH14 9.10 Polio'
   MB11    = 'EH14 9.11 Paralysis'
   MB12    = 'EH14 9.12 Epilepsy'
   MB13    = 'EH14 9.13 Mental illness'
   MB14    = 'EH14 9.14 STD or AIDS'
   MB15    = 'EH14 9.15 Other long term'
   MB16    = 'EH14 9.16 MJmorb Days Unable'
   MB17    = 'EH14 9.17 MJmorb Treatment'
   MB19_1  = 'EH15 9.19a1 MJmorb Who 1st'
   MB20_1  = 'EH15 9.20a1 MJmorb Where 1st'
   MB19_2  = 'EH15 9.19a2 MJmorb Who 2nd'
   MB20_2  = 'EH15 9.20a2 MJmorb Where 2nd'
   MB21    = 'EH15 9.21 MJmorb Days hosp'
   MB22    = 'EH15 9.22 MJmorb Cost Dr/hosp'
   MB23    = 'EH15 9.23 MJmorb Meds in cost'
   MB24    = 'EH15 9.24 MJmorb Cost Medicine'
   MB25    = 'EH15 9.25 MJmorb Cost Travel'
   AD1     = 'EH16 10.1 ID'
   AD2     = 'EH16 10.2 Difficulty Walking 1km'
   AD3     = 'EH16 10.3 Difficulty Toilet'
   AD4     = 'EH16 10.4 Difficulty Dressing'
   AD5     = 'EH16 10.5 Difficulty Hearing'
   AD6     = 'EH16 10.6 Difficulty Speaking'
   AD7     = 'EH16 10.7 Difficulty Far sight'
   AD8     = 'EH16 10.8 Difficulty Short sight'
   TO1     = 'EH17 12.1 Tobacco & alcohol: ID'
   TO2     = 'EH17 12.2 Tobacco: smoke'
   TO3     = 'EH17 12.3 Tobacco: chew'
   TO4     = 'EH17 12.4 Alcohol: drink'
   AP1     = 'EH38 25.1 Anthropometry ID'
   AP2     = 'EH38 25.2 Anthropometry Height'
   AP3     = 'EH38 25.3 Anthropometry Position'
   AP4     = 'EH38 25.4 Anthropometry Weight 1st'
   AP5     = 'EH38 25.5 Anthropometry Weight 2nd'
   TA2     = 'EH39 26.2 Test ID'
   TA3     = 'EH39 26.3 Test attended school'
   TA4     = 'EH39 26.4 Test completed std'
   TA5     = 'EH39 26.5 Test enjoy school'
   TA6     = 'EH39 26.6 Test teacher not nice'
   TA7LANG = 'EH39 26.7 Test reading language'
   TA7LVL  = 'EH39 26.7 Test reading score'
   TA8LANG = 'EH39 26.8 Test math language'
   TA8LVL  = 'EH39 26.8 Test math score'
   TA9LANG = 'EH39 26.9 Test writing language'
   TA9LVL  = 'EH39 26.9 Test writing score'
        ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (COPC >= -7 AND COPC <= -1) THEN COPC = .;
   IF (HC9 >= -7 AND HC9 <= -1) THEN HC9 = .;
   IF (HHASSETS >= -7 AND HHASSETS <= -1) THEN HHASSETS = .;
   IF (HHED5ADULT >= -7 AND HHED5ADULT <= -1) THEN HHED5ADULT = .;
   IF (HHED5F >= -7 AND HHED5F <= -1) THEN HHED5F = .;
   IF (HHED5M >= -7 AND HHED5M <= -1) THEN HHED5M = .;
   IF (RO1 >= -7 AND RO1 <= -1) THEN RO1 = .;
   IF (RO4 >= -7 AND RO4 <= -1) THEN RO4 = .;
   IF (RO5 >= -7 AND RO5 <= -1) THEN RO5 = .;
   IF (RO7 >= -7 AND RO7 <= -1) THEN RO7 = .;
   IF (FM28 >= -7 AND FM28 <= -1) THEN FM28 = .;
   IF (FM29 >= -7 AND FM29 <= -1) THEN FM29 = .;
   IF (FM30 >= -7 AND FM30 <= -1) THEN FM30 = .;
   IF (FM31 >= -7 AND FM31 <= -1) THEN FM31 = .;
   IF (AN5 >= -7 AND AN5 <= -1) THEN AN5 = .;
   IF (WS6YEAR >= -7 AND WS6YEAR <= -1) THEN WS6YEAR = .;
   IF (WS8ANNUAL >= -7 AND WS8ANNUAL <= -1) THEN WS8ANNUAL = .;
   IF (WS8HOURLY >= -7.00 AND WS8HOURLY <= -1.00) THEN WS8HOURLY = .;
   IF (WS10 >= -7 AND WS10 <= -1) THEN WS10 = .;
   IF (WS1 >= -7 AND WS1 <= -1) THEN WS1 = .;
   IF (WS3A = -3 OR WS3A = -4) THEN WS3A = .;
   IF (WS4A = -4 OR WS4A = -5 OR WS4A = -6) THEN WS4A = .;
   IF (WS5A >= -7 AND WS5A <= -1) THEN WS5A = .;
   IF (WS6A >= -7 AND WS6A <= -1) THEN WS6A = .;
   IF (WS6YEARA >= -7 AND WS6YEARA <= -1) THEN WS6YEARA = .;
   IF (WS7A = -4 OR WS7A = -5) THEN WS7A = .;
   IF (WS8A >= -7 AND WS8A <= -1) THEN WS8A = .;
   IF (WS8ANNUALA >= -7.00 AND WS8ANNUALA <= -1.00) THEN WS8ANNUALA = .;
   IF (WS8HOURLYA >= -7.00 AND WS8HOURLYA <= -1.00) THEN WS8HOURLYA = .;
   IF (WS9A = -4) THEN WS9A = .;
   IF (WS10A >= -7 AND WS10A <= -1) THEN WS10A = .;
   IF (WS11A >= -7 AND WS11A <= -1) THEN WS11A = .;
   IF (WS12A >= -7 AND WS12A <= -1) THEN WS12A = .;
   IF (NF7 >= -7 AND NF7 <= -1) THEN NF7 = .;
   IF (NF8 >= -7 AND NF8 <= -1) THEN NF8 = .;
   IF (NF9 >= -7 AND NF9 <= -1) THEN NF9 = .;
   IF (NF16 >= -7 AND NF16 <= -1) THEN NF16 = .;
   IF (NF17 >= -7 AND NF17 <= -1) THEN NF17 = .;
   IF (NF18 >= -7 AND NF18 <= -1) THEN NF18 = .;
   IF (NF25 >= -7 AND NF25 <= -1) THEN NF25 = .;
   IF (NF26 >= -7 AND NF26 <= -1) THEN NF26 = .;
   IF (NF27 >= -7 AND NF27 <= -1) THEN NF27 = .;
   IF (IN7 >= -7 AND IN7 <= -1) THEN IN7 = .;
   IF (IN7R >= -7 AND IN7R <= -1) THEN IN7R = .;
   IF (IN8 >= -7 AND IN8 <= -1) THEN IN8 = .;
   IF (IN8R >= -7.00 AND IN8R <= -1.00) THEN IN8R = .;
   IF (IN9 >= -7 AND IN9 <= -1) THEN IN9 = .;
   IF (IN9R >= -7 AND IN9R <= -1) THEN IN9R = .;
   IF (IN10 >= -7 AND IN10 <= -1) THEN IN10 = .;
   IF (IN10R >= -7 AND IN10R <= -1) THEN IN10R = .;
   IF (IN11 >= -7 AND IN11 <= -1) THEN IN11 = .;
   IF (IN11R >= -7.00 AND IN11R <= -1.00) THEN IN11R = .;
   IF (IN12 >= -7 AND IN12 <= -1) THEN IN12 = .;
   IF (IN12R >= -7.00 AND IN12R <= -1.00) THEN IN12R = .;
   IF (IN13 >= -7 AND IN13 <= -1) THEN IN13 = .;
   IF (IN13R >= -7 AND IN13R <= -1) THEN IN13R = .;
   IF (ED1 >= -7 AND ED1 <= -1) THEN ED1 = .;
   IF (ED2 >= -7 AND ED2 <= -1) THEN ED2 = .;
   IF (ED3 >= -7 AND ED3 <= -1) THEN ED3 = .;
   IF (ED4 >= -7 AND ED4 <= -1) THEN ED4 = .;
   IF (ED5 >= -7 AND ED5 <= -1) THEN ED5 = .;
   IF (ED6 >= -7 AND ED6 <= -1) THEN ED6 = .;
   IF (ED7 >= -7 AND ED7 <= -1) THEN ED7 = .;
   IF (ED8 >= -7 AND ED8 <= -1) THEN ED8 = .;
   IF (ED9 >= -7 AND ED9 <= -1) THEN ED9 = .;
   IF (ED10 >= -7 AND ED10 <= -1) THEN ED10 = .;
   IF (ED11 >= -7 AND ED11 <= -1) THEN ED11 = .;
   IF (ED12 >= -7 AND ED12 <= -1) THEN ED12 = .;
   IF (ED13 >= -7 AND ED13 <= -1) THEN ED13 = .;
   IF (CS2 >= -7 AND CS2 <= -1) THEN CS2 = .;
   IF (CS3 >= -7 AND CS3 <= -1) THEN CS3 = .;
   IF (CS4 >= -7 AND CS4 <= -1) THEN CS4 = .;
   IF (CS5 >= -7 AND CS5 <= -1) THEN CS5 = .;
   IF (CS6 >= -7 AND CS6 <= -1) THEN CS6 = .;
   IF (CS7 >= -7 AND CS7 <= -1) THEN CS7 = .;
   IF (CS8 >= -7 AND CS8 <= -1) THEN CS8 = .;
   IF (CS9 >= -7 AND CS9 <= -1) THEN CS9 = .;
   IF (CS10 >= -7 AND CS10 <= -1) THEN CS10 = .;
   IF (CS11 >= -7 AND CS11 <= -1) THEN CS11 = .;
   IF (CS12 >= -7 AND CS12 <= -1) THEN CS12 = .;
   IF (CS14 >= -7 AND CS14 <= -1) THEN CS14 = .;
   IF (CS15 >= -7 AND CS15 <= -1) THEN CS15 = .;
   IF (CS16 >= -7 AND CS16 <= -1) THEN CS16 = .;
   IF (CS17 >= -7 AND CS17 <= -1) THEN CS17 = .;
   IF (CS18 >= -7 AND CS18 <= -1) THEN CS18 = .;
   IF (CS19 >= -7 AND CS19 <= -1) THEN CS19 = .;
   IF (CS20 >= -7 AND CS20 <= -1) THEN CS20 = .;
   IF (SM1 >= -7 AND SM1 <= -1) THEN SM1 = .;
   IF (SM2 >= -7 AND SM2 <= -1) THEN SM2 = .;
   IF (SM3 >= -7 AND SM3 <= -1) THEN SM3 = .;
   IF (SM4 >= -7 AND SM4 <= -1) THEN SM4 = .;
   IF (SM5 >= -7 AND SM5 <= -1) THEN SM5 = .;
   IF (SM6 >= -7 AND SM6 <= -1) THEN SM6 = .;
   IF (SM7 >= -7 AND SM7 <= -1) THEN SM7 = .;
   IF (SM8 >= -7 AND SM8 <= -1) THEN SM8 = .;
   IF (SM9 >= -7 AND SM9 <= -1) THEN SM9 = .;
   IF (SM10 >= -7 AND SM10 <= -1) THEN SM10 = .;
   IF (SM11 >= -7 AND SM11 <= -1) THEN SM11 = .;
   IF (SM13A1 >= -7 AND SM13A1 <= -1) THEN SM13A1 = .;
   IF (SM14A1 >= -7 AND SM14A1 <= -1) THEN SM14A1 = .;
   IF (SM13A2 >= -7 AND SM13A2 <= -1) THEN SM13A2 = .;
   IF (SM14A2 >= -7 AND SM14A2 <= -1) THEN SM14A2 = .;
   IF (SM15 >= -7 AND SM15 <= -1) THEN SM15 = .;
   IF (SM16 >= -7 AND SM16 <= -1) THEN SM16 = .;
   IF (SM17 >= -7 AND SM17 <= -1) THEN SM17 = .;
   IF (SM18 >= -7 AND SM18 <= -1) THEN SM18 = .;
   IF (SM19 >= -7 AND SM19 <= -1) THEN SM19 = .;
   IF (MB1 >= -7 AND MB1 <= -1) THEN MB1 = .;
   IF (MB2 >= -7 AND MB2 <= -1) THEN MB2 = .;
   IF (MB3 >= -7 AND MB3 <= -1) THEN MB3 = .;
   IF (MB4 >= -7 AND MB4 <= -1) THEN MB4 = .;
   IF (MB5 >= -7 AND MB5 <= -1) THEN MB5 = .;
   IF (MB6 >= -7 AND MB6 <= -1) THEN MB6 = .;
   IF (MB7 >= -7 AND MB7 <= -1) THEN MB7 = .;
   IF (MB8 >= -7 AND MB8 <= -1) THEN MB8 = .;
   IF (MB9 >= -7 AND MB9 <= -1) THEN MB9 = .;
   IF (MB10 >= -7 AND MB10 <= -1) THEN MB10 = .;
   IF (MB11 >= -7 AND MB11 <= -1) THEN MB11 = .;
   IF (MB12 >= -7 AND MB12 <= -1) THEN MB12 = .;
   IF (MB13 >= -7 AND MB13 <= -1) THEN MB13 = .;
   IF (MB14 >= -7 AND MB14 <= -1) THEN MB14 = .;
   IF (MB15 >= -7 AND MB15 <= -1) THEN MB15 = .;
   IF (MB16 >= -7 AND MB16 <= -1) THEN MB16 = .;
   IF (MB17 >= -7 AND MB17 <= -1) THEN MB17 = .;
   IF (MB19_1 >= -7 AND MB19_1 <= -1) THEN MB19_1 = .;
   IF (MB20_1 >= -7 AND MB20_1 <= -1) THEN MB20_1 = .;
   IF (MB19_2 >= -7 AND MB19_2 <= -1) THEN MB19_2 = .;
   IF (MB20_2 >= -7 AND MB20_2 <= -1) THEN MB20_2 = .;
   IF (MB21 >= -7 AND MB21 <= -1) THEN MB21 = .;
   IF (MB22 >= -7 AND MB22 <= -1) THEN MB22 = .;
   IF (MB23 >= -7 AND MB23 <= -1) THEN MB23 = .;
   IF (MB24 >= -7 AND MB24 <= -1) THEN MB24 = .;
   IF (MB25 >= -7 AND MB25 <= -1) THEN MB25 = .;
   IF (AD1 >= -7 AND AD1 <= -1) THEN AD1 = .;
   IF (AD2 >= -7 AND AD2 <= -1) THEN AD2 = .;
   IF (AD3 >= -7 AND AD3 <= -1) THEN AD3 = .;
   IF (AD4 >= -7 AND AD4 <= -1) THEN AD4 = .;
   IF (AD5 >= -7 AND AD5 <= -1) THEN AD5 = .;
   IF (AD6 >= -7 AND AD6 <= -1) THEN AD6 = .;
   IF (AD7 >= -7 AND AD7 <= -1) THEN AD7 = .;
   IF (AD8 >= -7 AND AD8 <= -1) THEN AD8 = .;
   IF (TO2 >= -7 AND TO2 <= -1) THEN TO2 = .;
   IF (TO3 >= -7 AND TO3 <= -1) THEN TO3 = .;
   IF (TO4 >= -7 AND TO4 <= -1) THEN TO4 = .;
   IF (AP1 >= -7 AND AP1 <= -1) THEN AP1 = .;
   IF (AP2 >= -7 AND AP2 <= -1) THEN AP2 = .;
   IF (AP3 >= -7 AND AP3 <= -1) THEN AP3 = .;
   IF (AP4 >= -7.00 AND AP4 <= -1.00) THEN AP4 = .;
   IF (AP5 >= -7.00 AND AP5 <= -1.00) THEN AP5 = .;
   IF (TA2 >= -7 AND TA2 <= -1) THEN TA2 = .;
   IF (TA3 >= -7 AND TA3 <= -1) THEN TA3 = .;
   IF (TA4 >= -7 AND TA4 <= -1) THEN TA4 = .;
   IF (TA5 >= -7 AND TA5 <= -1) THEN TA5 = .;
   IF (TA6 >= -7 AND TA6 <= -1) THEN TA6 = .;
   IF (TA7LANG >= -7 AND TA7LANG <= -1) THEN TA7LANG = .;
   IF (TA7LVL >= -7 AND TA7LVL <= -1) THEN TA7LVL = .;
   IF (TA8LANG >= -7 AND TA8LANG <= -1) THEN TA8LANG = .;
   IF (TA8LVL >= -7 AND TA8LVL <= -1) THEN TA8LVL = .;
   IF (TA9LANG >= -7 AND TA9LANG <= -1) THEN TA9LANG = .;
   IF (TA9LVL >= -7 AND TA9LVL <= -1) THEN TA9LVL = .;
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT STATEID stateid. STATEID2 stateidf. DISTNAME distname.
         URBAN urban. METRO6 metro6ff. COPC copc.
         GROUPS8 groups8f. HC9 hc9fffff. HHASSETS hhassets.
         HHED5ADULT hhed5adf. HHED5F hhed5f. HHED5M hhed5m.
         WKANY wkany. WKFARM wkfarm. WKANIMAL wkanimal.
         WKAGWAGE wkagwage. WKNONAG wknonag. WKSALARY wksalary.
         WKBUSINESS wkbusinf. POOR poor. RO1 ro1fffff.
         RO3 ro3fffff. RO4 ro4fffff. RO5 ro5fffff.
         RO6 ro6fffff. RO7 ro7fffff. RO8 ro8fffff.
         RO9 ro9fffff. FM28 fm28ffff. FM29 fm29ffff.
         FM30 fm30ffff. FM31 fm31ffff. AN5 an5fffff.
         AN6 an6fffff. WS6YEAR ws6year. WS8ANNUAL ws8annuf.
         WS8HOURLY ws8hourf. WS10 ws10ffff. WS1 ws1fffff.
         WS3A ws3a. WS4A ws4a. WS5A ws5a.
         WS6A ws6a. WS6YEARA ws6yeara. WS7A ws7a.
         WS8A ws8a. WS8ANNUALA ws8ann0f. WS8HOURLYA ws8hou0f.
         WS9A ws9a. WS10A ws10a. WS11A ws11a.
         WS12A ws12a. NF7 nf7fffff. NF8 nf8fffff.
         NF9 nf9fffff. NF16 nf16ffff. NF17 nf17ffff.
         NF18 nf18ffff. NF25 nf25ffff. NF26 nf26ffff.
         NF27 nf27ffff. IN7 in7fffff. IN7R in7r.
         IN8 in8fffff. IN8R in8r. IN9 in9fffff.
         IN9R in9r. IN10 in10ffff. IN10R in10r.
         IN11 in11ffff. IN11R in11r. IN12 in12ffff.
         IN12R in12r. IN13 in13ffff. IN13R in13r.
         ED1 ed1fffff. ED2 ed2fffff. ED3 ed3fffff.
         ED4 ed4fffff. ED5 ed5fffff. ED6 ed6fffff.
         ED7 ed7fffff. ED8 ed8fffff. ED9 ed9fffff.
         ED10 ed10ffff. ED11 ed11ffff. ED12 ed12ffff.
         ED13 ed13ffff. CS2 cs2fffff. CS3 cs3fffff.
         CS4 cs4fffff. CS5 cs5fffff. CS6 cs6fffff.
         CS7 cs7fffff. CS8 cs8fffff. CS9 cs9fffff.
         CS10 cs10ffff. CS11 cs11ffff. CS12 cs12ffff.
         CS14 cs14ffff. CS15 cs15ffff. CS16 cs16ffff.
         CS17 cs17ffff. CS18 cs18ffff. CS19 cs19ffff.
         CS20 cs20ffff. SM1 sm1fffff. SM2 sm2fffff.
         SM3 sm3fffff. SM4 sm4fffff. SM5 sm5fffff.
         SM6 sm6fffff. SM7 sm7fffff. SM8 sm8fffff.
         SM9 sm9fffff. SM10 sm10ffff. SM11 sm11ffff.
         SM13A1 sm13a1ff. SM14A1 sm14a1ff. SM13A2 sm13a2ff.
         SM14A2 sm14a2ff. SM15 sm15ffff. SM16 sm16ffff.
         SM17 sm17ffff. SM18 sm18ffff. SM19 sm19ffff.
         MB1 mb1fffff. MB2 mb2fffff. MB3 mb3fffff.
         MB4 mb4fffff. MB5 mb5fffff. MB6 mb6fffff.
         MB7 mb7fffff. MB8 mb8fffff. MB9 mb9fffff.
         MB10 mb10ffff. MB11 mb11ffff. MB12 mb12ffff.
         MB13 mb13ffff. MB14 mb14ffff. MB15 mb15ffff.
         MB16 mb16ffff. MB17 mb17ffff. MB19_1 mb19_1ff.
         MB20_1 mb20_1ff. MB19_2 mb19_2ff. MB20_2 mb20_2ff.
         MB21 mb21ffff. MB22 mb22ffff. MB23 mb23ffff.
         MB24 mb24ffff. MB25 mb25ffff. AD1 ad1fffff.
         AD2 ad2fffff. AD3 ad3fffff. AD4 ad4fffff.
         AD5 ad5fffff. AD6 ad6fffff. AD7 ad7fffff.
         AD8 ad8fffff. TO2 to2fffff. TO3 to3fffff.
         TO4 to4fffff. AP1 ap1fffff. AP2 ap2fffff.
         AP3 ap3fffff. AP4 ap4fffff. AP5 ap5fffff.
         TA2 ta2fffff. TA3 ta3fffff. TA4 ta4fffff.
         TA5 ta5fffff. TA6 ta6fffff. TA7LANG ta7lang.
         TA7LVL ta7lvl. TA8LANG ta8lang. TA8LVL ta8lvl.
         TA9LANG ta9lang. TA9LVL ta9lvl.  ;
*/

RUN ;
