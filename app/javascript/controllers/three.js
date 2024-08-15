import * as THREE from "three";

/* ----------------
- scene
---------------- */
const scene = new THREE.Scene();
scene.background = new THREE.Color("#0B0F2B");

/* ----------------
- mesh
---------------- */
// Star
function createStars(numStars, radius, color) {
  const positions = new Float32Array(numStars * 3);
  const sizes = new Float32Array(numStars);

  for (let i = 0; i < numStars; i++) {
    const theta = Math.random() * Math.PI * 2;
    const phi = Math.random() * Math.PI;

    const sinPhi = Math.sin(phi);
    const x = radius * sinPhi * Math.cos(theta);
    const y = radius * sinPhi * Math.sin(theta);
    const z = radius * Math.cos(phi);

    const idx = i * 3;
    positions[idx] = x;
    positions[idx + 1] = y;
    positions[idx + 2] = z;

    sizes[i] = Math.random() * 0.9 + 0.1; // Random float between 0.1 and 1.0
  }

  const starsGeometry = new THREE.BufferGeometry();
  starsGeometry.setAttribute(
    "position",
    new THREE.Float32BufferAttribute(positions, 3)
  );
  starsGeometry.setAttribute(
    "size",
    new THREE.Float32BufferAttribute(sizes, 1)
  );

  const starMaterial = new THREE.ShaderMaterial({
    uniforms: {
      color: { value: new THREE.Color(color) },
    },
    vertexShader: `
      attribute float size;
      varying vec3 vColor;
      void main() {
        vColor = vec3(1.0);
        vec4 mvPosition = modelViewMatrix * vec4(position, 1.0);
        gl_PointSize = size * (300.0 / -mvPosition.z);
        gl_Position = projectionMatrix * mvPosition;
      }
    `,
    fragmentShader: `
      uniform vec3 color;
      varying vec3 vColor;
      void main() {
        gl_FragColor = vec4(color * vColor, 1.0);
      }
    `,
    blending: THREE.AdditiveBlending,
    depthTest: false,
    transparent: true,
  });

  const stars = new THREE.Points(starsGeometry, starMaterial);
  return stars;
}
const stars_main = createStars(1400, 160, "#ffffff");
scene.add(stars_main);
const stars_sub1 = createStars(600, 180, "#F2E205");
scene.add(stars_sub1);
const stars_sub2 = createStars(300, 200, "#DAFDBA");
scene.add(stars_sub2);

/* ----------------
- camera
---------------- */
const camera = new THREE.PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.1,
  1000
);
camera.position.z = 5;

/* ----------------
- renderer
---------------- */
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
const bg = document.createElement("div");
bg.id = "bg";
bg.appendChild(renderer.domElement);
document.body.appendChild(bg);

export const animate = function () {
  requestAnimationFrame(animate);
  stars_main.rotation.y += 0.001;
  stars_sub1.rotation.y += 0.001;
  stars_sub2.rotation.y += 0.001;
  renderer.render(scene, camera);
};
