window.addEventListener('message', function (event) {
    var v = event.data;
    switch (v.action) {
        case "showAnnounce":
            var jobInfo = {
                'police': {
                    title: 'LSPD',
                    color: '#010846',
                    image: 'assets/img/lspd.png'
                    
                },
                'ambulance':{
                    title: 'EMS',
                    color: 'red',
                    image: 'assets/img/ems.png'
                },
                'mechanic':{
                    title: 'Mechanic',
                    color: 'orange',
                    image: 'assets/img/mechanic.png'
                },
                'taxi':{
                    title: 'Taxi',
                    color: '#F9A825',
                    image: 'assets/img/taxi.png'
                },
                'uwu':{
                    title: 'UwU',
                    color: 'pink',
                    image: 'assets/img/cat.png'
                },
            };

            if (jobInfo.hasOwnProperty(v.job)) {
                var jobData = jobInfo[v.job];
                $('.container').fadeIn(300);
                $('#announce').text(v.announce);
                $('#jobTitle').text(jobData.title);
                $('#jobImage').attr('src', jobData.image); 
                $('.container').css('background-color', jobData.color);
                audio = new Audio('assets/sounds/notify.mp3');
                audio.play();
                setTimeout(function () {
                    $('.container').fadeOut();
                }, 5000);
            }
            break;
    }
});



