package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ServicioTurnos {
    private String horaInicio;
    private String horaFin;
    private int duracionTurnoMinutos;
    private Odontologo odonto;

    public ServicioTurnos(String horaInicio, String horaFin, int duracionTurnoMinutos, Odontologo odonto) {
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.duracionTurnoMinutos = duracionTurnoMinutos;
        this.odonto = odonto;
    }
     
    private int horaStringToMinutes(String hora){
        String[] partes = hora.split(":");
        int horas = Integer.parseInt(partes[0]);
        int minutos = Integer.parseInt(partes[1]);
        return horas * 60 + minutos;
    }

    public List<Turno> generarTurnosParaDia(Date dia, List<Turno> listaTurnos){
        int inicio = horaStringToMinutes(horaInicio);
        int fin = horaStringToMinutes(horaFin);

        for(int minutos = inicio; minutos < fin; minutos += duracionTurnoMinutos){
            Turno turno = new Turno();
            turno.setFecha_turno(dia);
            turno.setHora_turno(String.format("%02d:%02d", minutos / 60, minutos % 60));
            turno.setAfeccion(null);
            turno.setDisponible(true);
            turno.setOdonto(odonto);
            turno.setPacien(null);
            
            listaTurnos.add(turno);
        }

        return listaTurnos;
    }

    public List<Turno> obtenerTurnosDisponibles(Date dia, Horario horario, List<Turno> turnosReservados){
        List<Turno> turnos = new ArrayList<Turno>();
        turnos = generarTurnosParaDia(dia, turnos);

        for(Turno turnoReservado : turnosReservados){
            for(Turno turno : turnos){
                if(turno.getFecha_turno().equals(turnoReservado.getFecha_turno()) &&
                        turno.getHora_turno().equals(turnoReservado.getHora_turno())){
                    turno.setDisponible(false);
                }

            }
        }

        return turnos;
    }
}
