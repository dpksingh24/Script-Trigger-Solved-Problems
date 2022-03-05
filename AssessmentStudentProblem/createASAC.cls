/*
Create the following objects:
- Assessment : Name, AllowedtoConduct(CB)
- Student: Name, Roll no, TotalAssessmentGiven
- Assessment Conduct: Name(AN), Assessment, Student, Date

**1. Create 4 Assessments and 5 Students along with 20 Assessment Conduct records where only AllowedtoConduct Assessments are utilized.
**2. A Student can give only 1 AllowedtoConduct Assessment in a day
3. A Student cannot give an Assessment twice
4. Batch Job to update TotalAssessmentGiven on the Student record
*/ 

public class createASAC {
    //1. Create 4 Assessments and 5 Students along with 20 Assessment Conduct records where only AllowedtoConduct Assessments are utilized.
    public static void insertToAssessment(){
        List<Assessment__c> assList = new List<Assessment__c>();
        for(Integer i=0;i<4;i++){
            Assessment__c acc = new Assessment__c();
            acc.Name = 'Assessment 1: '+i;
            acc.AllowedtoConduct__c = False;
            assList.add(acc);
            }
            if(!assList.isEmpty()){
                insert assList;
            }
    }
    
    public static void insertStudents(){
        List<Student__c> StudentList = new List<Student__c>();
        for(Integer i=0;i<5;i++){
            Student__c student = new Student__c();
            student.Name = 'student 1: '+i;
            student.Roll_no__c = i;

            StudentList.add(student);
        }
        if(!StudentList.isEmpty()){
            insert StudentList;
        }
    }
    
    public static void insertAC(){
        List<Assessment_Conduct__c> assConList = new List<Assessment_Conduct__c>();
        Assessment__c ass = [select id from Assessment__c LIMIT 1];

        for(Integer i=0;i<20;i++){
            Assessment_Conduct__c assCon = new Assessment_Conduct__c();
            assCon.Assessment__c = ass.id;
            assConList.add(assCon);
        }
        if(!assConList.isEmpty()){
            Insert assConList;
        }
    }
    //2. A Student can give only 1 AllowedtoConduct Assessment in a day
    public static void onlyOneAss(){

        List<Assessment_Conduct__c> assConnList = new List<Assessment_Conduct__c>();
        
        Assessment__c Assessment = [SELECT Id FROM Assessment__c LIMIT 1];
        List<Student__c> StudentList = [SELECT Id,name FROM Student__c];
        
        for(Student__c student : StudentList){
            Assessment_Conduct__c assConduct = new Assessment_Conduct__c();
            
            assConduct.Student__c = student.Id;
            assConduct.Assessment__c = Assessment.Id;
            assConduct.Date__c = date.today();   
            
            assConnList.add(assConduct);
        }
        
        if(!assConnList.isEmpty()){
            System.debug('->'+assConnList);
            Insert assConnList;
        }
    }	
}
