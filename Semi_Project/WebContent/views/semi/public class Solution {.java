public class Solution {
    public String solution(int num) {
        String answer = "";

        String temp = String.valueOf(num);
        String[] num1 = {"zero","one", "two","three","four","five","six","seven","eight","nine"};
        String[] num2 = {"0","1","2","3","4","5","6","7","8","9"};
        String temp1="";
        for(int i=0; i<num1.length; i++){
            temp1 = temp.replace(num1[i],num2[i]);
        }
        return temp1;
    }
}