/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Exercises;
import Model.Subject;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class SubjectList {
    public List<Subject> Subjects = new ArrayList();
    public SubjectList(){
        ExercisesList Exes = new ExercisesList();
        try (BufferedReader br = new BufferedReader(new FileReader("subjects.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] subinfo = line.split(";");
//                for(String s : subinfo){
//                    System.out.println(s);
//                }
//              
                if(subinfo.length>1){
                    Subject sub = new Subject(subinfo[0],subinfo[1]);
                    List<Exercises> Exes1 = sub.getExercises();
                    for(Exercises e : Exes.ExercisesList){
                        if(e.getSubjectId().equals(sub.getSubjectId())){
                            Exes1.add(e);
                        };
                    }
                    sub.setExercises(Exes1);
                    Subjects.add(sub);
                }
                
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return "SubjectList{" + "Subjects=" + Subjects + '}';
    }
    
    public void display(){
        System.out.println("List of subjects: ");
        System.out.println(String.format("%-10s %s", "ID", "Name"));
        for(Subject s : Subjects){
            System.out.println(String.format("%-10s %s", s.getSubjectId(), s.getName()));
        }
        System.out.println("\n");
    }
    

}
