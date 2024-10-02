public without sharing class ShiftInsertion {

    @AuraEnabled
    public static void createShiftBasedonOrgCreation(){
        
        Organization org = [Select CreatedDate from Organization];
        ServiceResource sr = [Select Id,Name from ServiceResource where Name ='Tom Hankers'];
        ServiceTerritory st = [Select Id from ServiceTerritory where Name = 'Market Street'];
        //WorkTypeGroup  wtg = [Select Id from WorkTypeGroup  where Name='Mortgage'];
        
        String actualWeekDay = '';
        String serviceresource = sr.Id;
        String serviceterritory = st.Id;
        //String worktypegroup = wtg.Id;
        
        Integer orgCreationDays = 30;
        Integer iCounter = 0;
        
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
        
        for(Integer i = 1;i <= orgCreationDays;i++){
            actualStartTime = dt.AddDays(i);
            actualWeekDay = dt.AddDays(i).format('EEEE');
            
            if(bWeek1 && actualFistWeekList.contains(actualWeekDay)){
            
                shiftStartTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 17, 00, 00);
                shiftEndTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 24, 00, 00);
                
            }
            else if (bWeek2 && actualSecondWeekList.contains(actualWeekDay)){
                shiftStartTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 17, 00, 00);
                shiftEndTime = DateTime.newInstanceGMT(actualStartTime.year(), actualStartTime.month(), actualStartTime.day(), 19, 00, 00);
            }
            else {
                if(actualWeekDay.equalsIgnoreCase('Saturday')){
                    if(iCounter == 0){
                        bWeek1 = true;
                        bWeek2 = false;
                    }
                    else{
                        bWeek1 = !bWeek1;
                        bWeek2 = !bWeek2;
                        }
                }
                continue;
            }
            iCounter++;
            Shift shift = new Shift(StartTime =shiftStartTime,EndTime=shiftEndTime,Status='Confirmed',ServiceResourceId=serviceresource,ServiceTerritoryId=serviceterritory);
            shiftList.add(shift);
            if(iCounter >= 10){
                break;
            }
        }
        insert shiftList;    

    }
                
    @AuraEnabled
    public static Integer getShiftCount(){

        Integer icount = [Select count() from Shift];
        return icount;  

    }        
}