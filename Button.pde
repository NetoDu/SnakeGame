class Button {
  PVector pos;
  color textColor, hoverColor;
  float size, tWidth;
  String text;
  PFont fButton;
  
 
 
  Button(String text, PVector pos, float size, color textColor, color hoverColor) {
    this.pos = pos;  //Posição do botão
    this.textColor = textColor;  //Cor do botão
    this.hoverColor = hoverColor; //Cor do botão quando o mouse passar em cima dele
    this.size = size;  //Tamanho do texto
    this.text = text;  //O texto em si
    textSize(size);
    tWidth = textWidth(text);
  }

  void draw(boolean on) {
    textSize(size);

    if (containsMouse()) fill(hoverColor);  //Se o mouse passar em cima, preencher com a cor
    else fill(textColor);                                 //definida na variavel "hovercolor"
    text(text, pos.x, pos.y + size);
    if (on)
      rect(pos.x, pos.y, tWidth, size);
  }

  boolean containsMouse() {
    if (mouseX > pos.x && mouseX < pos.x + 1.8*tWidth && mouseY > pos.y && mouseY < pos.y + size )
      return true;
    else return false;
    
  }
}
