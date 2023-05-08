/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Exercises;
import Model.Mark;
import Model.Student;
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
public class MarkList {
    public List<Mark> marks = new ArrayList();
    ExercisesList exes = new ExercisesList();
    public MarkList(){
        try (BufferedReader br = new BufferedReader(new FileReader("marks.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] markinfo = line.split(";");
//                for(String s : subinfo){
//                    System.out.println(s);
//                }
//              
                if(markinfo.length>1){
                    marks.add(new Mark(markinfo[0],markinfo[1],markinfo[2],Double.parseDouble(markinfo[3])));
                }
                
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public void addMark(Mark mark){
        for(Mark m : marks){
            if(m.getExercise().equals(mark.getExercise())&&m.getStudentId().equals(mark.getStudentId())&&m.getSubjectId().equals(mark.getSubjectId())){
                m.setMark(mark.getMark());
            }
        }
        
        try {
                FileWriter writer = new FileWriter("marks.txt",false);
                for(Mark m : marks){
                    writer.write(m.toString()+"\n");
                }
                writer.close();
                System.out.println("Successfully wrote to the file.");
            } catch (IOException e) {
                System.out.println("An error occurred "+e.getMessage());
            }
    }
    
    public Mark inputMark(){
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter student ID in the list: ");
        String studID = sc.nextLine();
        while(!CheckStudId(studID)){
            System.out.print("Enter student ID in the list: ");
            studID = sc.nextLine();
        }
        
       SubjectList subjects = new SubjectList();
        
        subjects.display();
        System.out.print("Enter subject ID in the list: ");
        String subID = sc.nextLine();
        
        while(!exes.CheckSubId(subID)){
             System.out.print("Enter subject ID in the list: ");
             subID = sc.nextLine();
        }
        
        display(studID, subID);
        
        System.out.print("Enter Excercise in the list: ");
        String Excercise = sc.nextLine();
        while(Excercise.length()<1||Excercise==null||!CheckEx(Excercise, subID)){
            System.out.print("Enter Excercise in the list: ");
            Excercise = sc.nextLine();
        }
        System.out.print("Enter Mark (1 - 10): ");
        Double mark = Double.parseDouble(sc.nextLine());
        while(mark<1||mark>10){
            System.out.print("Enter Mark (1 - 10): ");
            mark = Double.parseDouble(sc.nextLine());
        }
        
        addMark(new Mark(studID,subID,Excercise, mark));
        
        display(studID, subID);
        
        return new Mark(studID,subID,Excercise, mark);
    }
    
    public boolean CheckStudId(String id){
        StudentList studlist = new StudentList();
        for(Student s : studlist.students){
            if(s.getStudentID().equals(id)) return true;
        }
        return false;
    }
    
    public boolean CheckEx(String Ex, String subID){
        for(Exercises s : exes.ExercisesList){
            if(s.getExercise().equals(Ex)&&s.getSubjectId().equals(subID)) {
                return true;
            }
        }
        return false;
    }
    
    public void display(String studID, String subID){
        double total = 0;
        System.out.println("\nList of marks of "+subID+" of "+studID+"");
        System.out.println(String.format("%-10s %10s %5s", "Exercise","Percentage","Mark"));
        for(Mark m : marks){
            if(m.getSubjectId().equals(subID)&&m.getStudentId().equals(studID)){
                for(Exercises e : exes.ExercisesList){
                    if(e.getSubjectId().equals(subID)&&e.getExercise().equals(m.getExercise())){
                        total += e.getPercent()*m.getMark();
                        System.out.println(String.format("%-10s %10.2f %5.2f", m.getExercise(), e.getPercent(), m.getMark()));
                    }
                }
                
            }
        }
        System.out.println("=================================");
        System.out.println(String.format("%-21s %5.2f\n", "Total", total));
    }
}
