package sfit.be.elison.tvshowapp;

public class Utility {

    private static String port = ":5000" ;
    private static String protocol = "http://" ;


    // below ippaddress will bee changed as per use case
    private static String ipAddress = "192.168.1.132" ;

    private static  String getIpAddress() {
        return ipAddress+port;

    }

    private static  String getProtocol() {
        return protocol;

    }



    public static String getBaseUrl()
    {
        return getProtocol() + getIpAddress() ;
    }
}

