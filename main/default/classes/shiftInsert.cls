public class shiftInsert {
    @AuraEnabled   
    public static void createShiftBasedonOrgCreation(){
    Organization org = [Select CreatedDate from Organization];
    ServiceResource sr = [Select Id from ServiceResource where Name = 'Will Smith'];
    ServiceTerritory st=[Select Id from ServiceTerritory where Name = 'Minna Street Branch'];
    WorkTypeGroup  wtg = [Select Id from WorkTypeGroup  where Name='Customised Portfolio'];
    
    String actualWeekDay='';
    String serviceresource = sr.Id;
    String serviceterritory= st.Id;
    String worktypegroup = wtg.Id;  
    
    Integer orgCreationDays = 30;
    Integer iCounter = 0;
    Integer iSRRandom = 0;
    
    Boolean bWeek1 = true;
    Boolean bWeek2 = false;
        
    DateTime dt = org.CreatedDate;
    DateTime shiftStartTime;
    DateTime actualStartTime;
    DateTime shiftEndTime;
    DateTime actualEndTime;
    
    List<String> actualFistWeekList = new List<String>{'Monday','Wednesday','Friday'};
    List<String> actualSecondWeekList = new List<String>{'Tuesday','Thursday'};
    List<Shift> shiftList = new List<Shift>();
    
    for(Integer i=1;i<=orgCreationDays;i++){
        //   //generate a random number
        // iSRRandom = Integer.valueof((Math.random() * sr.size()));
        // serviceresource = sr[iSRRandom].Id; 
        actualStartTime=dt.AddDays(i);
        System.debug('actualStartTime is '+actualStartTime);
        actualWeekDay = dt.AddDays(i).format('EEEE');
        
        if(bWeek1 && actualFistWeekList.contains(actualWeekDay)){
        
            shiftStartTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 17, 00, 00);
            shiftEndTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 24, 00, 00);
         
        }
        else if (bWeek2 && actualSecondWeekList.contains(actualWeekDay)){
            shiftStartTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 17, 00, 00);
            shiftEndTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 19, 00, 00);
            
             System.debug('shiftStartTime is '+shiftStartTime);
             System.debug('shiftEndTime   is '+shiftEndTime);
        }
        else {
            if(actualWeekDay.equalsIgnoreCase('Saturday')){
                if(iCounter==0){
                   bWeek1=true;
                   bWeek2=false;
                }
                else{
                    bWeek1 = !bWeek1;
                    bWeek2 = !bWeek2;
                     // System.debug('boolean values are'+bWeek1+'-'+bWeek2);
                    }
            }
            continue;
        }
        iCounter++;
        Shift shift = new Shift(StartTime =shiftStartTime,EndTime=shiftEndTime,Status='Confirmed',ServiceResourceId=serviceresource,ServiceTerritoryId=serviceterritory,WorkTypeGroupId =worktypegroup);
        shiftList.add(shift);
        if(iCounter >=10){
            break;
        }
        System.debug('shift created is '+shift);
    }
    insert shiftList;     
        }
        
        @AuraEnabled
        public static Integer getShiftCount(){
            Integer icount=[Select count() from Shift];
            System.debug('count in apex method is '+icount);
            return [Select count() from Shift];
              
        }
    
    
    
    
    
}