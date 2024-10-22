
// Récursivité
//Flocon de koch

int niveau = 0; // Niveau de récursivité

//Environement
void setup() { 
  size(800, 600);
  background(0);
  stroke(255);
  frameRate(30);
}

void draw() {
  background(0);
  translate(width / 2, height / 2); // Centre la figure
  
  float taille = 300;  // Définit la taille initiale du triangle 
  
  for (int i = 0; i < 3; i++) {   // Dessine les 3 flocons
    kochFlocon(-taille / 2, sqrt(3) * taille / 6, taille, 0, niveau);
    rotate(TWO_PI / 3); // Rotation pour former un triangle équilatéral
  }
  
  // Augmente le nievau de recursivité pour voir la fractale evoluer 
  if (frameCount % 60 == 0 && niveau < 6) {
    niveau++; // change le niveau tous les 60 frames
  }
}

// Fonction récursive pour dessiner un côté du flocon de Koch
void kochFlocon(float x1, float y1, float x2, float y2, int n) {
  if (n == 0) {
    // si on atteint le niveau de récursivité demandé, dessine une simple ligne 
   line(x1, y1, x2, y2);
  } else {
    // calcule les points intermédiaires
    float dx = (x2 - x1) / 3;
    float dy = (y2 - y1) / 3;
    float x3 = x1 + dx;
    float y3 = y1 + dy;
    float x5 = x1 + 2 * dx;
    float y5 = y1 + 2 * dy;
    
    // point au sommet du triangle équilatéral 
    float x4 = (x1 + x2) / 2 + sqrt(3) * (y1 - y2) / 6;
    float y4 = (y1 + y2) / 2 + sqrt(3) * (x2 - x1) / 6;
    
    // appels récursifs pour dessiner les 4 segments
    kochFlocon(x1, y1, x3, y3, n - 1); // segment 1
    kochFlocon(x3, y3, x4, y4, n - 1); // segment 2 (triangle)
    kochFlocon(x4, y4, x5, y5, n - 1); // segment 3 (triangle)
    kochFlocon(x5, y5, x2, y2, n - 1); // segment 4
  }
}
    
   // RECOPIER A LA MAIN POUR L'APPRENTISSAGE *
    
    
    
    
    
    
    
    
    
    
