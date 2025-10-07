$(document).ready(function () {
    window.addEventListener('message', function (event) {
        switch (event.data.action) {
            case "updateWaypoint":
                var meter = event.data.m
                meter = meter.toFixed(0)
                $(".waypoint span").html(meter + " m")
                var x = event.data.x * 100;
                var y = event.data.y * 100;
                // if (x < 0) x = 5;
                if (x > 95) x = 92;
                // if (y < 0) y = 5;
                // if (y > 100) y  = 95;
                // console.log(`Waypoint position: ${x}%, ${y}%`);
                $(".waypoint").css({
                    '--dist': meter,
                    'left': `${x}%`,
                    'top': `${y}%`,
                })
                break;
            case "showWaypoint":
                $(".waypoint").show()
                break;
            case "hideWaypoint":
                $(".waypoint").hide()
                break;
        }
    });
});