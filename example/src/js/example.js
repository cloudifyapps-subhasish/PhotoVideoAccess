import { PhotoVideoAccess } from 'photo-video-access';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    PhotoVideoAccess.echo({ value: inputValue })
}
