public class PackageClass {

    public class customException extends Exception{}

    public static void main(){
        System.debug('Hello World');
    }

    public static Integer addTwoNumbers(Integer a, Integer b){
        return a+b;
    }

    public static Integer addTwoNumbersWithExceptionHandling(Integer a, Integer b){
        Integer c;
        try{
            c = a+b;
            if(b==4){
                throw new customException('Divide by zero');
            }
        }catch(Exception e){ 
            return 0;
        }
        return c;
    }
}