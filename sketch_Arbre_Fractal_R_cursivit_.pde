float angle;
float branchLength = 50; // Longueur initiale des branches
float growthRate = 0.5;  // Taux de croissance de l'arbre

void setup() {
  size(800, 600);
  stroke(255); // Couleur des branches
  background(0); // Fond noir
  frameRate(30); // Taux de rafraîchissement
}

void draw() {
  background(0);
  angle = map(mouseX, 0, width, 0, TWO_PI); // Angle contrôlé par la position de la souris
  translate(width / 2, height); // On place le "tronc" à la base de la fenêtre
  branch(branchLength); // Longueur initiale de la branche
  
  // Augmente la taille des branches progressivement
  if (branchLength < 150) {
    branchLength += growthRate; // Fait croître l'arbre
  }
}

void branch(float len) {
  // Dessine la branche
  strokeWeight(map(len, 10, 150, 1, 8)); // Épaisseur de la branche
  line(0, 0, 0, -len); // Dessine une ligne représentant une branche
  translate(0, -len); // Se déplace au bout de la branche

  // Si la branche est trop courte, on arrête la récursivité
  if (len > 10) {
    pushMatrix();
    rotate(angle); // Tourne à droite
    branch(len * 0.67); // Appel récursif pour la branche suivante
    popMatrix();
    
    pushMatrix();
    rotate(-angle); // Tourne à gauche
    branch(len * 0.67); // Appel récursif pour la branche suivante
    popMatrix();
  } else {
    // Ajouter des feuilles aux extrémités
    fill(0, 255, 0); // Couleur des feuilles (vert)
    noStroke();
    ellipse(0, 0, 10, 10); // Dessine une feuille
    stroke(255); // Rétablit la couleur des branches
  }
}
