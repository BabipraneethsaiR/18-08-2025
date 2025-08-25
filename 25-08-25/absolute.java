package basic;
import java.util.Scanner;

public class absolute {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		int a = sc.nextInt();
		if(a<0){
			System.out.println(a*-1);
			
		}
		else if(a>0){
			System.out.println(a);
		}
		
	}

}
