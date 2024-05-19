import * as THREE from "./packs/three.module.min.js";

// - scene
const scene = new THREE.Scene();
scene.background = new THREE.Color("#0B0F2B");

// - mesh
const material = new THREE.PointsMaterial({
  color: "#ffffff",
  size: 0.7,
  transparent: true,
  blending: THREE.AdditiveBlending,
});
const starsGeometry = new THREE.SphereGeometry(200, 32, 32);
const positions = [];
for (let i = 0; i < 5000; i++) {
  positions.push(THREE.MathUtils.randFloatSpread(2000)); // x
  positions.push(THREE.MathUtils.randFloatSpread(2000)); // y
  positions.push(THREE.MathUtils.randFloatSpread(2000)); // z
}
starsGeometry.setAttribute(
  "position",
  new THREE.Float32BufferAttribute(positions, 3)
);
const stars = new THREE.Points(starsGeometry, material);
scene.add(stars);

// - camera
const camera = new THREE.PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.1,
  1000
);
camera.position.z = 5;

// - renderer
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
