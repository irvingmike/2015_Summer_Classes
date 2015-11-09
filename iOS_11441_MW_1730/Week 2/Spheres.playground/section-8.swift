////////// Output //////////

func outputSphereCalculations(sphereRadius: Double) {
    println("Sphere")
    println("======")
    println(String(format: "Radius: %.1f", sphereRadius))
    println(String(format: "Surface: %.10f", sphereSurfaceAreaWithRadius(sphereRadius)))
    println(String(format: "Volume: %.10f",sphereVolumeWithRadius(sphereRadius)))
}

//
