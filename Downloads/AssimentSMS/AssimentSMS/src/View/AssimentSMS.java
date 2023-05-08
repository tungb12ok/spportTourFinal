/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package View;

import Controller.*;
import java.util.Scanner;

/**
 *
 * @author toden
 */
public class AssimentSMS {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc = new Scanner(System.in);
        ExercisesList exlist = new ExercisesList();
        MarkList marklist = new MarkList();
        SubjectList sublist = new SubjectList();
        StudentList stulist = new StudentList();
        int choice = 0;
        do{
            Menu();
            switch(choice = Integer.parseInt(sc.nextLine())){
                case 1:
                    sublist.display();
                    exlist.inputEx();
                    break;
                case 2:
                    stulist.display();
                    marklist.inputMark();
                    break;
            }
        }while(choice!=5);
    }
    
    public static void Menu(){
        System.out.println("Assiment: A1601, Group 1\n"
                + " Menu\n"
                + "1. Add a new exercise for the given subject.\n"
                + "2. Enter an exercise's marks of the given subject for a student\n"
                + "3. Exit\n"
                + "please enter 1, 2, or 3:");
    }
    
}
