/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author toden
 */
public class Exercises {
    String SubjectId;
    String Exercise;
    double Percent;

    public Exercises() {
    }

    public Exercises(String SubjectId, String Exercise, double Percent) {
        this.SubjectId = SubjectId;
        this.Exercise = Exercise;
        this.Percent = Percent;
    }

    public String getSubjectId() {
        return SubjectId;
    }

    public void setSubjectId(String SubjectId) {
        this.SubjectId = SubjectId;
    }

    public String getExercise() {
        return Exercise;
    }

    public void setExercise(String Exercise) {
        this.Exercise = Exercise;
    }

    public double getPercent() {
        return Percent;
    }

    public void setPercent(double Percent) {
        this.Percent = Percent;
    }

    @Override
    public String toString() {
        return SubjectId + ";" + Exercise + ";" + Percent;
    }
    
    
}
