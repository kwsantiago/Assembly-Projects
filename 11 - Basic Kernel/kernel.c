void main(){
    char *video_memory = (char*) 0xb8000; // Point to first text cell of video memory
    *video_memory = 'X'; // store X here and it will display on screen when we boot
}
