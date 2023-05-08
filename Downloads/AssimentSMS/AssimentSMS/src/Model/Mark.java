/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author toden
 */
public class Mark {
    String StudentId;
    String SubjectId;
    String Exercise;
    double Mark;

    public Mark() {
    }

    public Mark(String StudentId, String SubjectId, String Exercise, double Mark) {
        this.StudentId = StudentId;
        this.SubjectId = SubjectId;
        this.Exercise = Exercise;
        this.Mark = Mark;
    }

    public String getStudentId() {
        return StudentId;
    }

    public void setStudentId(String StudentId) {
        this.StudentId = StudentId;
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

    public double getMark() {
        return Mark;
    }

    public void setMark(double Mark) {
        this.Mark = Mark;
    }

    @Override
    public String toString() {
        return StudentId + ";" + SubjectId + ";" + Exercise + ";" + Mark;
    }
    
    
}
