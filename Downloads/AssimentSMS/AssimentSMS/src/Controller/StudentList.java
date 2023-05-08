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
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class StudentList {
    public List<Student> students = new ArrayList();
    
    public StudentList(){
        MarkList markList = new MarkList();
        try (BufferedReader br = new BufferedReader(new FileReader("students.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] studinfo = line.split(";");
//                for(String s : subinfo){
//                    System.out.println(s);
//                }
//              
                if(studinfo.length>1){
                    Student stud = new Student(studinfo[0],studinfo[1],studinfo[2],studinfo[3]);
                    List<Mark> marks1 = stud.getMarks();
                    for(Mark m : markList.marks){
                        if(m.getStudentId().equals(stud.getStudentID())){
                            marks1.add(m);
                        };
                    }
                    stud.setMarks(marks1);
                    students.add(stud);
                }
                
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public void display(){
        System.out.println("List of Students: ");
        System.out.println(String.format("%-10s %s", "ID", "Name"));
        for(Student s : students){
            System.out.println(String.format("%-10s %s", s.getStudentID(), s.getName()));
        }
        System.out.println("\n");
    }
    
    
}
