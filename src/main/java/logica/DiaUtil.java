package logica;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DiaUtil {

    public static Date convertirDiaSemanaAFecha(String diaSemana) throws ParseException {
        // Crear un calendario con la fecha actual
        Calendar calendar = Calendar.getInstance();

        // Mapeo de los días de la semana a los valores de Calendar
        int diaSemanaCalendar;
        switch (diaSemana.toLowerCase()) {
            case "lunes":
                diaSemanaCalendar = Calendar.MONDAY;
                break;
            case "martes":
                diaSemanaCalendar = Calendar.TUESDAY;
                break;
            case "miercoles":
                diaSemanaCalendar = Calendar.WEDNESDAY;
                break;
            case "jueves":
                diaSemanaCalendar = Calendar.THURSDAY;
                break;
            case "viernes":
                diaSemanaCalendar = Calendar.FRIDAY;
                break;
            default:
                throw new IllegalArgumentException("Día de la semana no válido: " + diaSemana);
        }

        // Ajustar el calendario al día de la semana correspondiente
        calendar.set(Calendar.DAY_OF_WEEK, diaSemanaCalendar);

        // Obtener la fecha correspondiente
        return calendar.getTime();
    }
    
    public static String convertirFechaADiaNombre(Date dia) {
        // Crear un calendario y configurarlo con la fecha proporcionada
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dia);

        // Formateador para obtener solo el nombre del día de la semana
        SimpleDateFormat formatDia = new SimpleDateFormat("EEEE", new Locale("es", "ES"));

        // Obtener el nombre del día en español
        String nombreDia = formatDia.format(calendar.getTime());

        return nombreDia;
    }

}
