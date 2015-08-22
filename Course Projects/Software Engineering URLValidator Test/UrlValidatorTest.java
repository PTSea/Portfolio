/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * FINAL PROJECT PART B: BUGGY URL VALIDATOR TEST SUITE
 * GROUP: PHILIP TAN, BRYAN BAUER, ROBERT SPARKS
 * CS 362 SOFTWARE ENGINEERING 2
 * LAST EDITED: 8/10/15
 * 
*/

import junit.framework.TestCase;



/**
 * Performs Validation Test for url validations.
 *
 * @version $Revision: 1128446 $ $Date: 2011-05-27 13:29:27 -0700 (Fri, 27 May 2011) $
 */
public class UrlValidatorTest extends TestCase {

   private boolean printStatus = false;
   private boolean printIndex = false;//print index that indicates current scheme,host,port,path, query test were using.

   public UrlValidatorTest(String testName) {
      super(testName);
   }

   
   
   public void testManualTest()
   {
	   System.out.println("----------------------- MANUAL TESTS: should validate -----------------------");
	   
	   //Should validate
	   UrlValidator urlVal = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("VALID URL: http://www.amazon.com, TEST RETURNS: ");
	   System.out.print(urlVal.isValid("http://www.amazon.com"));
	   System.out.println();
	   
	   //Should validate 
	   UrlValidator urlVal1 = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("VALID URL: http://www.google.com/search, TEST RETURNS: ");
	   System.out.print(urlVal1.isValid("http://www.google.com/search"));
	   System.out.println();
	   
	   //Should validate
	   UrlValidator urlVal2 = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("VALID URL: http://hostname, TEST RETURNS: ");
	   System.out.print(urlVal2.isValid("http://hostname"));
	   System.out.println();
	   
	   //Should validate
	   UrlValidator urlVal3 = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("VALID URL: http://localhost/test/index.html, TEST RETURNS: ");
	   System.out.print(urlVal3.isValid("http://localhost/test/index.html"));
	   System.out.println();
	   
	   System.out.println();
	   
	   System.out.println("----------------------- MANUAL TESTS: should not validate -----------------------");
	   //Should not validate
	   UrlValidator urlVal4 = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("INVALID URL: http://first.my-testing/test/index.html, TEST RETURNS: ");
	   System.out.print(urlVal4.isValid("http://first.my-testing/test/index.html"));
	   System.out.println();
	   
	   //Should not validate
	   UrlValidator urlVal5 = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("INVALID URL: http://broke.hostname/test/index.html, TEST RETURNS: ");
	   System.out.print(urlVal5.isValid("http://broke.hostname/test/index.html"));
	   System.out.println();
	   
	   //Should not validate
	   UrlValidator urlVal6 = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("INVALID URL: file:///C:\\\\some.file, TEST RETURNS: ");
	   System.out.print(urlVal6.isValid("file:///C:\\some.file"));
	   System.out.println();
	   
	   //Should not validate
	   UrlValidator urlVal7 = new UrlValidator(null, null, UrlValidator.ALLOW_ALL_SCHEMES);
	   System.out.print("INVALID URL: file://C:\\\\some.file, TEST RETURNS: ");
	   System.out.print(urlVal7.isValid("file://C:\\some.file"));
	   System.out.println();
	   
	   System.out.println();
   }
   
   
   public void testYourFirstPartition()
   {   
	   System.out.println();
	   System.out.println();
	   System.out.println("--------------------- FIRST PARTITION SET: -----------------------");
	   System.out.println();

	// NativeMethodAccessorlmpl.involk (object...) line NA -> urlVlidatorTest line 62 DeligatinMethodAccessormpl.invoke(object...) ln 43 .... 
	   System.out.println("--------------------- Partition 1 Set 1: http/https : Should be True -----------------------");
	   
	   //Subset one
	   String[] schemes = {"http","https"};
       UrlValidator urlVal6 = new UrlValidator(schemes);
       //Should validate to true
	   System.out.println(urlVal6.isValid("http://www.amazon.com"));
	   
	   /*
	   String[] schemes5 = {"https://"};
       UrlValidator urlVal13 = new UrlValidator(schemes5);
       //Should validate to true
	   System.out.println(urlVal13.isValid("https://www.amazon.com"));
	   */
	   
	   System.out.println("--------------------- Partition 1 Set 2: http/https : Should be True -----------------------");
	   //Subset two 
       UrlValidator urlVal7 = new UrlValidator(schemes);
       //Should validate to true
	   System.out.println(urlVal7.isValid("https://tech.yahoo.com/rc/desktops/102;_ylt=Ao8yevQHlZ4On0O3ZJGXLEQFLZA5"));

	   
	   System.out.println("--------------------- Partition 1 Set 3: http/https : Should be False -----------------------");
	   //Subset two 
       UrlValidator urlVal8 = new UrlValidator(schemes);
       //Should validate to false
	   System.out.println(urlVal8.isValid("http://broke.hostname/test/index.html"));

	   
	   System.out.println("--------------------- Partition 1 Set 4: ftp : Should be True -----------------------");
	   
	   //Subset three 
	   String[] schemes2 = {"ftp"};
	   UrlValidator urlVal9 = new UrlValidator(schemes2);
	   //Should validate to true
	   System.out.println(urlVal9.isValid("ftp://ftp.freebsd.org/pub/FreeBSD/"));

	   
	   System.out.println("--------------------- Partition 1 Set 5: h3t : Should be True -----------------------");
	   //Subset four
	   String[] schemes3 = {"h3t"};
	   UrlValidator urlVal10 = new UrlValidator(schemes3);
	   //Should validate to true
	   System.out.println(urlVal10.isValid("h3t://255.255.255.255"));

	   
	   System.out.println("--------------------- Partition 1 Set 6: h3t : Should be False -----------------------");
	   UrlValidator urlVal11 = new UrlValidator(schemes2);
       //Should validate to false
	   System.out.println(urlVal11.isValid("http://broke.hostname/test/index.html"));
	   
	   String[] schemes4 = {""};
	   System.out.println("--------------------- Partition 1 Set 7: NULL SCHEME : Should be True -----------------------");
	   UrlValidator urlVal12 = new UrlValidator(schemes4);
       //Should validate to true
	   System.out.println(urlVal12.isValid("amazon.com"));
	   System.out.println();
   }
	   
   
   public void testYourSecondPartition()
   {
	   System.out.println("--------------------- SECOND PARTITION SET: -----------------------");
	   System.out.println();
	// NativeMethodAccessorlmpl.involk (object...) line NA -> urlVlidatorTest line 62 DeligatinMethodAccessormpl.invoke(object...) ln 43 .... 
	   System.out.println("--------------------- Partition 2 Set 1-A: hostname : Should be True -----------------------");
	   UrlValidator validator = new UrlValidator(UrlValidator.ALLOW_LOCAL_URLS);
	   //"hostname should validate"
	   System.out.println(validator.isValid("http://hostname"));
	   //"hostname.com should validate"
	   System.out.println("--------------------- Partition 2 Set 1-B: hostname.com : Should be True -----------------------");
	   System.out.println(validator.isValid("http://hostname.com"));
	   
	   System.out.println("--------------------- Partition 2 Set 2-A: localhost : Should be True -----------------------");
	   //"localhost should validate"
	   System.out.println(validator.isValid("http://localhost"));
	   
	   System.out.println("--------------------- Partition 2 Set 2-B: localhost.com  : Should be True -----------------------");
	   //"localhost.com should validate"
	   System.out.println(validator.isValid("http://localhost.com"));
	   
	   System.out.println("--------------------- Partition 2 Set 2-C: localhost/test/index.html : Should be True -----------------------");
	   //""http://localhost/test/index.html" should validate"
	   System.out.println(validator.isValid("http://localhost/test/index.html"));
	   
	   // non of the following should now validate
	   System.out.println("--------------------- Partition 2 Set 3-A: hostname=false : Should be False -----------------------");
	   validator = new UrlValidator(0);
	   System.out.println( validator.isValid("http://hostname"));
	   System.out.println("--------------------- Partition 2 Set 3-B: hostname.com=false : Should be False -----------------------");
	   System.out.println(validator.isValid("http://hostname.com"));
	   System.out.println("--------------------- Partition 2 Set 3-B: localhost/test/index.html.com=false : Should be False -----------------------");
	   System.out.println(validator.isValid("http://localhost/test/index.html"));
	   
   }
   

   public void testIsValid()
   {
	   
	   System.out.println("--------------------- Testing Known True Urls -----------------------");
	   String fullUrl = "";
	   int bugCount = 0;
	   int correctCount = 0;
	   UrlValidator validator = new UrlValidator(UrlValidator.ALLOW_LOCAL_URLS);
	 
	   //TRUE
	   //schemes: 4
	   for(int i = 0; i < 4; i++) {
		   //authority: 7
		   for(int x = 0; x < 7; x++) {
			 //Port: 5
			   for(int k= 0; k < 5; k++) {
				 //Path: 4
				   for (int j = 0; j < 4; j++) {
					 //Query: 3
					   for(int y = 0; y < 3; y++){   
						  fullUrl = truetestUrlScheme[i] + truetestUrlAuthority[x] + truetestUrlPort[k] + truetestPath[j] + testUrlQuery[y];
						  validator = new UrlValidator(0);
						  validator.isValid(fullUrl);
						  //System.out.println( validator.isValid(fullUrl));
						  boolean numberofBugs = validator.isValid(fullUrl);
						  if(numberofBugs == false){
							 bugCount++;
							 //System.out.println(fullUrl);
						  }
						  else if (numberofBugs == true) {
							 correctCount++;
						  }
					   }
				   }
			   }
		   }   
	   }
	   System.out.println("Incorrect URL Count: ");
	   System.out.println(bugCount);
	   System.out.println("Correct URL Count: ");
	   System.out.println(correctCount);
	   System.out.println();
   }
   
  
   public void testAnyOtherUnitTest()
   {
	   System.out.println("--------------------- Testing Known False Urls -----------------------");
	   String fullUrl = "";
	   int bugCount = 0;
	   int correctCount = 0;
	   UrlValidator validator = new UrlValidator(UrlValidator.ALLOW_LOCAL_URLS);
	 
	   //FALSE
	   //schemes: 5
	   for(int i = 0; i < 5; i++) {
		   //authority: 12
		   for(int x = 0; x < 12; x++) {
			 //Port: 2
			   for(int k= 0; k < 2; k++) {
				 //Path: 5
				   for (int j = 0; j < 4; j++) {
					 //Query: 3
					   for(int y = 0; y < 3; y++){   
						  fullUrl = falsetestUrlScheme[i] + falsetestUrlAuthority[x] + falsetestUrlPort[k] + falsetestPath[j] + testUrlQuery[y];
						  validator = new UrlValidator(0);
						  validator.isValid(fullUrl);
						  //System.out.println( validator.isValid(fullUrl));
						  boolean numberofBugs = validator.isValid(fullUrl);
						  if(numberofBugs == false){
							 correctCount++;
						  }
						  else if (numberofBugs == true) {
							 bugCount++;
							 //System.out.println(fullUrl);
						  }
					   }
				   }
			   }
		   }   
	   }

	   System.out.println("Incorrect URL Count: ");
	   System.out.println(bugCount);
	   System.out.println("Correct URL Count: ");
	   System.out.println(correctCount);
	   System.out.println();
   }
 
 
//---------THE FOLLOWING SECTION IS ARRAYS OF THE DIFFERENT PARTS OF URLS, SPLIT UP BETWEEN KNOWN VALID AND INVALID---------//
// 4
String[] truetestUrlScheme = {
		 "http://", //True
           "ftp://", //True
           "h3t://", //True
           ""}; //True
// 5
String[] falsetestUrlScheme = {
		"3ht://", //False
        "http:/", //False
        "http:", //False
        "http/", //False
        "://"}; //False
// 7
String[] truetestUrlAuthority = {
		"www.google.com",//True
              "go.com", //True
              "go.au", //True
              "0.0.0.0", //True
              "255.255.255.255", //True
              "255.com", //True
              "go.cc", //True
};
// 12
String[] falsetestUrlAuthority = {
        "256.256.256.256", //False
        "1.2.3.4.5", //False
        "1.2.3.4.", //False
        "1.2.3", //False
        ".1.2.3.4", //False
        "go.a", //False
        "go.a1a", //False
        "go.1aa", //False
        "aaa.", //False
        ".aaa", //False
        "aaa", //False
        "" //False
};
// 5
String [] truetestUrlPort = {":80", //True
         ":65535", //True
         ":0", //True
         "", //True
         ":65636" //True
};
// 2
String [] falsetestUrlPort = {
        ":-1", //False
        ":65a" //False
};
// 4
String [] truetestPath = {
		"/test1", //True
      "/test1/", //True
      "", //True
      "/test1/file" //True
};
// 5
String [] falsetestPath = {
	      "/t123",//False
	      "/..", //False
	      "/../", //False
	      "/..//file", //False
	      "/test1//file" //False
	};
// 3
String [] testUrlQuery = {"?action=view", //true
          "?action=edit&mode=up", //true 
          ""}; //true


}
