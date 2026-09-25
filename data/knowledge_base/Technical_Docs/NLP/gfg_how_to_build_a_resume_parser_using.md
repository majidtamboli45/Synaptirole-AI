# How to build a Resume Parser using Python

> Source: https://www.geeksforgeeks.org/nlp/project-how-to-build-a-resume-parser-using-python/

A Resume Parser is a valuable tool for HR professionals and organizations looking to streamline their recruitment process. It automates the extraction of key information from resumes, making it easier to manage and analyze candidate data. These are helpful in shortlisting candidates based on certain criteria without the hectic task of going through each Resume manually and evaluating it. In this post, we will guide you in creating a Resume Parser from scratch and extracting key information from a typical candidate Resume using Python Programming.
Build a Resume Parser using Python
Now let us see how we can use Python to parse the resume.
Required Packages
spacy: This package uses Natural Language Processing under the hood and extracts key information from the Resume.
pip install spacy==2.3.5
pyresparser: This is the main package that depends on space.
pip install https://github.com/explosion/spacy-models/releases/download/
en_core_web_sm-2.3.1/en_core_web_sm-2.3.1.tar.gz
en_core_web_sm: This is the trained model of texts used for detecting entities.
pip install pyresparser
Install all the above packages using pip in the same order mentioned (Use Virtual Environment if you get any issues in the installation)
Note: The package functions correctly only for above given spacy version. Uninstall previous versions of packages if present on your PC.
Fields Supported by the Package
This package supports parsing for the following data fields in Resume.
- Name
- Mobile numbers
- Skills
- Total Experience
- College Name
- Degree
- Designation
- Company Names
Creating File
- Create a new folder on your PC and open it in your editor (VS Code).
- Create a new file named "app.py" in this newly created folder. (This is the main file where we do our work)
Importing pyresparser: It is used for extracting entities from Resume and warnings are used to hide warnings related to the package as it's using an old spacy version.
!pip install nltk
import nltk
nltk.download('stopwords')
from pyresparser import ResumeParser
import warnings
# This code is modified by Susobhan Akhuli
Ignoring Warnings: This code is used to ignore the warnings.
warnings.filterwarnings("ignore", category=UserWarning)
Parsing the file: Place your Resume file in the working directory. The package supports PDF and DOCx files for parsing.
data = ResumeParser("resume.pdf").get_extracted_data()
Replace "resume.pdf" with your file name and Extracted data is stored in variable 'data'. The following code prints all the fields extracted.Here we are printing all the fields of the resume which we have stored after passing the resume.
print("Name:", data["name"])
print("Email:", data["email"])
print("Mobile Number:", data["mobile_number"])
print("Skills:", data["skills"])
print("College Name:", data["college_name"])
print("Degree:", data["degree"])
print("Designation:", data["designation"])
print("Company Names:", data["company_names"])
print("No Of Pages:", data["no_of_pages"])
print("Total Experience:", data["total_experience"])
Complete Code Implementation
This Python code uses the Pyresparser library to extract essential information from a resume in PDF format. It ignores any user warnings that might occur during the process. After parsing the resume, it prints details such as the person's 'name', 'email', 'skills', 'educational background', 'work experience', and more. This automated approach simplifies the extraction of valuable data from resumes for tasks like HR and recruitment.
from pyresparser import ResumeParser
import warnings
warnings.filterwarnings("ignore", category=UserWarning)
data = ResumeParser("resume.pdf").get_extracted_data()
print("Name:", data["name"])
print("Email:", data["email"])
print("Mobile Number:", data["mobile_number"])
print("Skills:", data["skills"])
print("College Name:", data["college_name"])
print("Degree:", data["degree"])
print("Designation:", data["designation"])
print("Company Names:", data["company_names"])
print("No Of Pages:", data["no_of_pages"])
print("Total Experience:", data["total_experience"])
Output
Get the complete notebook and dataset link here:
Notebook: click here.
Dataset: click here.
