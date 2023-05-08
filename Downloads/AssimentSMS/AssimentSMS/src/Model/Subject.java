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
public class Subject {
    String SubjectId;
    String Name;
    List<Exercises> Exercises = new ArrayList();

    public Subject() {
    }

    public Subject(String SubjectId, String Name) {
        this.SubjectId = SubjectId;
        this.Name = Name;
    }

    public String getSubjectId() {
        return SubjectId;
    }

    public void setSubjectId(String SubjectId) {
        this.SubjectId = SubjectId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public List<Exercises> getExercises() {
        return Exercises;
    }

    public void setExercises(List<Exercises> Exercises) {
        this.Exercises = Exercises;
    }

    @Override
    public String toString() {
        return SubjectId + ";" + Name + ";" + Exercises;
    }
    
    
}
