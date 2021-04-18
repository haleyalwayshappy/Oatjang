/**
 *
 */
import * as THREE from "./three/build/three.module.js";
import { OBJLoader } from "./three/examples/jsm/loaders/OBJLoader.js";
import {OrbitControls} from 'https://threejsfundamentals.org/threejs/resources/threejs/r122/examples/jsm/controls/OrbitControls.js';
// import { OBJLoader } from './loaders/OBJLoader.js';

function main() {
    let container;

    let camera, scene, renderer;
    let w, h;

    let object;

    // container = document.createElement( 'div' );
    container = document.getElementById("renderCanvas");
    w = container.offsetWidth;
    h = container.offsetHeight;
    // document.body.appendChild( container );

    camera = new THREE.PerspectiveCamera(75, w / h, 0.1, 1000);
	camera.position.z = 3;
	
	const controls = new OrbitControls(camera, container);
	controls.target.set(0.3, 0, 0);
	controls.enableDamping = true;
	controls.update();


    // scene
    scene = new THREE.Scene();
    // const ambientLight = new THREE.AmbientLight(0xcccccc, 0.4);
    // scene.add(ambientLight);

    // const pointLight = new THREE.PointLight(0xffffff, 0.8);
    // camera.add(pointLight);
    // scene.add(camera);


    // Lights

    scene.add( new THREE.HemisphereLight( 0x443333, 0x111122 ) );

    addShadowedLight( 1, 1, 1, 0xffffff, 1.35 );
    addShadowedLight( 0.5, 1, - 1, 0x8f4f23, 1 );
    // renderer

 

    renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setClearColor("#f2dcce");
	renderer.setSize( w, h );

    // stats

    // stats = new Stats();
    // container.appendChild( stats.dom );


    function addShadowedLight( x, y, z, color, intensity ) {

        const directionalLight = new THREE.DirectionalLight( color, intensity );
        directionalLight.position.set( x, y, z );
        scene.add( directionalLight );

        directionalLight.castShadow = true;

        const d = 1;
        directionalLight.shadow.camera.left = - d;
        directionalLight.shadow.camera.right = d;
        directionalLight.shadow.camera.top = d;
        directionalLight.shadow.camera.bottom = - d;

        directionalLight.shadow.camera.near = 1;
        directionalLight.shadow.camera.far = 4;

        directionalLight.shadow.bias = - 0.002;

    }


    // Floor
    const plane = new THREE.Mesh(
        new THREE.PlaneBufferGeometry( 100, 100 ),
        new THREE.MeshPhongMaterial( { color: 0x999999, specular: 0x101010 } )
    );
    plane.rotation.x = - Math.PI / 2;
    plane.position.y = -1.7;
    scene.add( plane );

    plane.receiveShadow = true;




    // manager
    function loadModel() {
        object.traverse(function (child) {
            if (child.isMesh) child.material.map = texture;
        });

        scene.add(object);
    }

    const manager = new THREE.LoadingManager(loadModel);

    manager.onProgress = function (item, loaded, total) {
        console.log(item, loaded, total);
    };

    // texture

    const textureLoader = new THREE.TextureLoader(manager);
    const texture = textureLoader.load("lib/model/oak.jpg");

    // model

    const loader = new OBJLoader(manager);
    loader.load(
        "lib/model/W.obj",
        function (obj) {
            obj.position.y = -1.7;
            object = obj;
        },
        function (xhr) {
            if (xhr.lengthComputable) {
                const percentComplete = (xhr.loaded / xhr.total) * 100;
                console.log(
                    "model " + Math.round(percentComplete, 2) + "% downloaded"
                );
            }
        },
        // called when loading has errors
        function (error) {
            console.log("An error happened");
        }
    );

    renderer.setSize(w, h);
	container.appendChild(renderer.domElement);
	
	// hover
	$('#community').hover(function () {
		console.log("community");
	})


	// animation
	function animate() {
		requestAnimationFrame(animate);
		if (object != null) {
			object.rotation.y += 0.01;
			object.rotation.y = object.rotation.y % (Math.PI * 2);
			console.log(object.rotation.y);
		}
		controls.update();
		render();
	}
	
	function render() {
		renderer.render(scene, camera);
	}
	
	animate();
}



main();