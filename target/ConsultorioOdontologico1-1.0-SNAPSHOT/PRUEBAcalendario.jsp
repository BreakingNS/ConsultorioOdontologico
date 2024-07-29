<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reserva de Turnos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        #calendar-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .calendar {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .days {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .day {
            padding: 10px;
            border: 1px solid #ddd;
            margin: 5px;
            cursor: pointer;
            border-radius: 5px;
        }
        .day.available {
            background-color: #fff;
        }
        .day.unavailable {
            background-color: #eee;
            cursor: not-allowed;
        }
        .day.selected {
            background-color: #007bff;
            color: #fff;
        }
        #times-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .time {
            padding: 10px;
            border: 1px solid #ddd;
            margin: 5px;
            cursor: pointer;
            border-radius: 5px;
        }
        .time.selected {
            background-color: #007bff;
            color: #fff;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border-radius: 5px;
        }
        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>

    <h1>Reserva de Turnos</h1>

    <div id="calendar-container">
        <div class="calendar">
            <h2>Seleccioná un día</h2>
            <div class="days" id="days">
                <!-- Los días se llenarán dinámicamente -->
            </div>
        </div>
    </div>

    <div id="times-container">
        <div class="times">
            <h2>Seleccioná un Horario</h2>
            <div id="times">
                <!-- Los horarios se llenarán dinámicamente -->
            </div>
        </div>
    </div>

    <form id="booking-form" method="post" action="ReservarTurnoServlet">
        <input type="hidden" id="selected-date" name="selected-date" />
        <input type="hidden" id="selected-time" name="selected-time" />
        <button type="submit" id="submit-button" disabled>Reservar Turno</button>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const days = document.getElementById('days');
            const times = document.getElementById('times');
            const submitButton = document.getElementById('submit-button');
            let selectedDate = '';
            let selectedTime = '';

            const availableDays = [
                '2024-07-21', '2024-07-23', '2024-07-24', '2024-07-25',
                '2024-07-29', '2024-08-01'
            ];

            const availableTimes = [
                '12:00', '12:10', '12:20', '12:30', '13:00'
            ];

            availableDays.forEach(day => {
                const dayElement = document.createElement('div');
                dayElement.classList.add('day', 'available');
                dayElement.textContent = new Date(day).toLocaleDateString('es-ES', { day: 'numeric', month: 'short' });
                dayElement.dataset.date = day;
                dayElement.addEventListener('click', () => {
                    document.querySelectorAll('.day').forEach(el => el.classList.remove('selected'));
                    dayElement.classList.add('selected');
                    selectedDate = day;
                    document.getElementById('selected-date').value = selectedDate;
                    updateTimes();
                });
                days.appendChild(dayElement);
            });

            function updateTimes() {
                times.innerHTML = '';
                availableTimes.forEach(time => {
                    const timeElement = document.createElement('div');
                    timeElement.classList.add('time');
                    timeElement.textContent = time;
                    timeElement.dataset.time = time;
                    timeElement.addEventListener('click', () => {
                        document.querySelectorAll('.time').forEach(el => el.classList.remove('selected'));
                        timeElement.classList.add('selected');
                        selectedTime = time;
                        document.getElementById('selected-time').value = selectedTime;
                        submitButton.disabled = false;
                    });
                    times.appendChild(timeElement);
                });
            }
        });
    </script>

</body>
</html>


