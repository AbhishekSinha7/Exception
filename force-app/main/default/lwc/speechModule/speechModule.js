import { LightningElement, track } from 'lwc';

export default class SpeechModule extends LightningElement {
    @track recognizedText = '';
    recognition;

    connectedCallback() {
        window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        if (window.SpeechRecognition) {
            this.recognition = new window.SpeechRecognition();
            this.recognition.continuous = true;
            this.recognition.interimResults = false;
            this.recognition.lang = 'ja';

            this.recognition.onresult = (event) => {
                const lastResult = event.results[event.results.length - 1];
                if (lastResult.isFinal) {
                    this.recognizedText = lastResult[0].transcript;
                }
            };

            this.recognition.onerror = (event) => {
                console.error('Speech recognition error', event.error);
            };
        } else {
            console.error('Speech Recognition API not supported in this browser.');
        }
    }

    startListening() {
        if (this.recognition) {
            this.recognition.start();
        }
    }

    stopListening() {
        if (this.recognition) {
            this.recognition.stop();
        }
    }

}