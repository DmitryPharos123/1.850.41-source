public without sharing class GetRecordId {

   @AuraEnabled(cacheable = true)
   public static List<WorkTypeGroup> getWorkTypeGroups() {    

       return [SELECT ID from WorkTypeGroup ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];  

   }

   @AuraEnabled(cacheable = true)
   public static List<WorkType> getWorkTypes() {  

       return [SELECT ID from WorkType ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   

   }

   @AuraEnabled(cacheable = true)
   public static List<WorkTypeGroupMember> getWorkTypeGroupMembers() {
       
       return [SELECT ID from WorkTypeGroupMember ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];  

   }

   @AuraEnabled(cacheable = true)
   public static List<ServiceTerritory> getServiceTerritories() {
       
       return [SELECT ID from ServiceTerritory ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];

   }

   @AuraEnabled(cacheable = true)
   public static List<ServiceTerritoryWorkType> getServiceTerritoryWorkTypes() {

      return [SELECT ID from ServiceTerritoryWorkType ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   

   }

    @AuraEnabled(cacheable = true)
   public static List<OperatingHours> getOperatingHours() {

      return [SELECT ID from OperatingHours ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1]; 
        
   }
   
   @AuraEnabled(cacheable = true)
   public static List<TimeSlot> getTimeSlots() {

      return [SELECT ID from TimeSlot ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];  

   }

    @AuraEnabled(cacheable = true)
   public static List<AppointmentTopicTimeSlot> getAppointmentTopicTimeSlots() {

      return [SELECT ID from AppointmentTopicTimeSlot ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   

   }

   @AuraEnabled(cacheable = true)
   public static List<SkillRequirement> getSkillRequirements() {

      return [SELECT ID from SkillRequirement ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];  

   }

   @AuraEnabled(cacheable = true)
   public static List<ServiceResource> getServiceResources(String resourceType) {

      return [SELECT ID from ServiceResource WHERE ResourceType=:resourceType ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];  

   }

   @AuraEnabled(cacheable = true)
   public static List<ServiceResourceSkill> getServiceResourceSkills() {

      return [SELECT ID from ServiceResourceSkill ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];  

   }

   @AuraEnabled(cacheable = true)
   public static List<ServiceTerritoryMember> getServiceTerritoryMembers() {

      return [SELECT ID from ServiceTerritoryMember ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   

   }

   @AuraEnabled(cacheable = true)
   public static List<ResourceAbsence> getResourceAbsences() {

      return [SELECT ID from ResourceAbsence ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   

   }

   @AuraEnabled(cacheable = true)
   public static List<ListView> getShifts() {

      return [SELECT ID  from ListView  where DeveloperName  = 'All_Shifts'  LIMIT 1];   

   }

   @AuraEnabled(cacheable = true)
   public static List<OperatingHoursHoliday> getOperatingHoursHolidays() {

      return [SELECT ID from OperatingHoursHoliday ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   

   }

   @AuraEnabled(cacheable = true)
   public static List<ServiceAppointment> getServiceAppointments(String appNum) {

      return [SELECT ID from ServiceAppointment WHERE AppointmentNumber=:appNum ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1]; 

   }

   @AuraEnabled(cacheable = true)
   public static List<Account> getAccounts() {

      return [SELECT ID from Account WHERE Name like '%Rachel Adams%' LIMIT 1];  

   }

  @AuraEnabled(cacheable = true)
  public static List<User> getUserIdGreeter() {
     return [SELECT ID from User WHERE profile.name like '%Greeter%' LIMIT 1];  
  }

  @AuraEnabled(cacheable = true)
  public static List<User> getUserIdBO() {
     return [SELECT ID from User WHERE profile.name like '%Branch%' LIMIT 1];  
  }

//Get shift ID for adding concurrency scenario details in the Shift tile
  @AuraEnabled(cacheable = true)
  public static List<Shift> getShiftForConcurrency() {
     return [SELECT ID from Shift WHERE ShiftNumber = 'SFT-0038' LIMIT 1];  
  }

}