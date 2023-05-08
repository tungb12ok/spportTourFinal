/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Exercises;
import Model.Subject;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author toden
 */
public class ExercisesList {

    public List<Exercises> ExercisesList = new ArrayList();

    public ExercisesList() {
        try ( BufferedReader br = new BufferedReader(new FileReader("Exercises.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] Exsinfo = line.split(";");
//                for(String s : subinfo){
//                    System.out.println(s);
//                }
//              
                if (Exsinfo.length > 1) {
                    ExercisesList.add(new Exercises(Exsinfo[0], Exsinfo[1], Double.parseDouble(Exsinfo[2])));
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean addEx(Exercises ex) {
        for (Exercises e : ExercisesList) {
            if (e.getSubjectId().equals(ex.getSubjectId()) && e.getExercise().equals(ex.getExercise())) {
                return false;
            }
        }
        if (ExercisesList.add(ex)) {
            try {
                FileWriter writer = new FileWriter("Exercises.txt",true);
                writer.write("\n"+ex.toString());
                writer.close();
                System.out.println("Successfully wrote to the file.");
            } catch (IOException e) {
                System.out.println("An error occurred "+e.getMessage());
            }
            return true;
        }
        return false;
    }
    
    public Exercises inputEx(){
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter subjectID In the list: ");
        String subID = sc.nextLine();
        while(!CheckSubId(subID)){
            System.out.print("Enter subjectID In the list: ");
            subID = sc.nextLine();
        }
        
        display(subID);
        
        System.out.print("Enter Excercise Name (Not Empty): ");
        String Name = sc.nextLine();
        while(Name.length()<1||Name==null){
            System.out.print("Enter Excercise Name (Not Empty): ");
            Name = sc.nextLine();
        }
        System.out.print("Enter Percent (1 - 96.25): ");
        Double Percent = Double.parseDouble(sc.nextLine());
        while(Percent<1||Percent>96.25){
            System.out.print("Enter Percent (1 - 96.25): ");
            Percent = Double.parseDouble(sc.nextLine());
        }
        addEx(new Exercises(subID, Name, Percent));
        
        display(subID);
        
        return new Exercises(subID, Name, Percent);
    }
    
    public boolean CheckSubId(String id){
        SubjectList sublist = new SubjectList();
        for(Subject s : sublist.Subjects){
            if(s.getSubjectId().equals(id)) return true;
        }
        return false;
    }
    
    public void display(String subID){
        double total = 0;
        System.out.println("\nList of excercise of subject "+subID+":");
        System.out.println(String.format("%-10s %s", "Name","Percentage"));
        for(Exercises ex : ExercisesList){
            if(ex.getSubjectId().equals(subID)){
                total += ex.getPercent();
                System.out.println(String.format("%-10s %.2f", ex.getExercise(), ex.getPercent()));
            }
        }
        System.out.println("=================================");
        System.out.println(String.format("%-10s %.2f\n", "Total", total));
    }
}
