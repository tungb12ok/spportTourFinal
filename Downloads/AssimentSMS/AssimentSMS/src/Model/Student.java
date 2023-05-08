/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class Student {
    String StudentID;
    String Name;
    String Age;
    String Class;
    List<Mark> Marks = new ArrayList();

    public Student() {
    }

    public Student(String StudentID, String Name, String Age, String Class) {
        this.StudentID = StudentID;
        this.Name = Name;
        this.Age = Age;
        this.Class = Class;
    }

    public String getStudentID() {
        return StudentID;
    }

    public void setStudentID(String StudentID) {
        this.StudentID = StudentID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAge() {
        return Age;
    }

    public void setAge(String Age) {
        this.Age = Age;
    }

    public String gettClass() {
        return Class;
    }

    public void setClass(String Class) {
        this.Class = Class;
    }

    public List<Mark> getMarks() {
        return Marks;
    }

    public void setMarks(List<Mark> Marks) {
        this.Marks = Marks;
    }

    @Override
    public String toString() {
        return StudentID + ";" + Name + ";" + Age + ";" + Class + ";" + Marks;
    }
    
    
}
