public class GetUserDetails {
    public static void printUserDetails(){
        User objUser = new User();
        objUser = [SELECT id,Name,Email,Phone FROM User WHERE Id = :Userinfo.getUserId()];
        System.debug('user Details: '+objUser);
        System.debug('user Phone NO: '+objUser.Phone);
    }
}