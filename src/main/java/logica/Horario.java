package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Horario implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_horario; 
    private String horario_inicio; 
    private String horario_fin;
    private int duracionTurnoMinutos;
    private String diasAtencion;

    public Horario() {
    }

    public Horario(int id_horario, String horario_inicio, String horario_fin, int duracionTurnoMinutos) {
        this.id_horario = id_horario;
        this.horario_inicio = horario_inicio;
        this.horario_fin = horario_fin;
        this.duracionTurnoMinutos = duracionTurnoMinutos;
    }

    public int getId_horario() {
        return id_horario;
    }

    public String getHorario_inicio() {
        return horario_inicio;
    }

    public String getHorario_fin() {
        return horario_fin;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
    }

    public void setHorario_inicio(String horario_inicio) {
        this.horario_inicio = horario_inicio;
    }

    public void setHorario_fin(String horario_fin) {
        this.horario_fin = horario_fin;
    }

    public int getDuracionTurnoMinutos() {
        return duracionTurnoMinutos;
    }

    public void setDuracionTurnoMinutos(int duracionTurnoMinutos) {
        this.duracionTurnoMinutos = duracionTurnoMinutos;
    }

    public String getDiasAtencion() {
        return diasAtencion;
    }

    public void setDiasAtencion(String diasAtencion) {
        this.diasAtencion = diasAtencion;
    }
}
