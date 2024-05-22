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
const numStars = 2000;
const radius = 160;
const positions = [];
const sizes = [];

for (let i = 0; i < numStars; i++) {
  const theta = THREE.MathUtils.randFloat(0, Math.PI * 2);
  const phi = THREE.MathUtils.randFloat(0, Math.PI);

  const x = radius * Math.sin(phi) * Math.cos(theta);
  const y = radius * Math.sin(phi) * Math.sin(theta);
  const z = radius * Math.cos(phi);

  positions.push(x, y, z);
  sizes.push(THREE.MathUtils.randFloat(0.1, 1.0));
}

const starsGeometry = new THREE.BufferGeometry();
starsGeometry.setAttribute(
  "position",
  new THREE.Float32BufferAttribute(positions, 3)
);
starsGeometry.setAttribute("size", new THREE.Float32BufferAttribute(sizes, 1));

const starMaterial = new THREE.ShaderMaterial({
  uniforms: {
    color: { value: new THREE.Color("#ffffff") },
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
scene.add(stars);

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
  stars.rotation.y += 0.001;
  renderer.render(scene, camera);
};
