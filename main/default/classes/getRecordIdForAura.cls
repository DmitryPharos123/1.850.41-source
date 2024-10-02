public class getRecordIdForAura{
    @AuraEnabled
    public static List<WorkTypeGroup> getWorkTypeGroups() {
        
        return [SELECT ID from WorkTypeGroup ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];  
    }
    @AuraEnabled
    public static List<WorkType> getWorkTypes() {
        
        return [SELECT ID from WorkType ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];    
    }
    @AuraEnabled
    public static List<WorkTypeGroupMember> getWorkTypeGroupMembers() {
        
        return [SELECT ID from WorkTypeGroupMember ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceTerritory> getServiceTerritories() {
        
        return [SELECT ID from ServiceTerritory ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceTerritoryWorkType> getServiceTerritoryWorkTypes() {
       return [SELECT ID from ServiceTerritoryWorkType ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
     @AuraEnabled
    public static List<OperatingHours> getOperatingHours() {
       return [SELECT ID from OperatingHours ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<TimeSlot> getTimeSlots() {
       return [SELECT ID from TimeSlot ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
     @AuraEnabled
    public static List<AppointmentTopicTimeSlot> getAppointmentTopicTimeSlots() {
       return [SELECT ID from AppointmentTopicTimeSlot ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<SkillRequirement> getSkillRequirements() {
       return [SELECT ID from SkillRequirement ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceResource> getServiceResources() {
       return [SELECT ID from ServiceResource WHERE ResourceType='T' ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceResource> getServiceResourceAssets() {
       return [SELECT ID from ServiceResource WHERE ResourceType='S' ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceResourceSkill> getServiceResourceSkills() {
       return [SELECT ID from ServiceResourceSkill ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceTerritoryMember> getServiceTerritoryMembers() {
       return [SELECT ID from ServiceTerritoryMember ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ResourceAbsence> getResourceAbsences() {
       return [SELECT ID from ResourceAbsence ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ListView> getShifts() {
       return [SELECT ID  from ListView  where DeveloperName  = 'All_Shifts'  LIMIT 1];   
    }
    @AuraEnabled
    public static List<OperatingHoursHoliday> getOperatingHoursHolidays() {
       return [SELECT ID from OperatingHoursHoliday ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceAppointment> getServiceAppointments() {
       return [SELECT ID from ServiceAppointment WHERE AppointmentNumber='SA-0001' ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<ServiceAppointment> getServiceAppointmentsForAssetMultiResource() {
       return [SELECT ID from ServiceAppointment WHERE AppointmentNumber='SA-0003' ORDER BY LastModifiedDate DESC NULLS LAST LIMIT 1];   
    }
    @AuraEnabled
    public static List<Account> getAccounts() {
       return [SELECT ID from Account WHERE Name like '%Rachel Adams%' LIMIT 1];   
    }
}