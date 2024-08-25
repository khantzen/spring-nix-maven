package fr.noether.nix.build.nix_spring_app

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class NixSpringAppApplication

fun main(args: Array<String>) {
	runApplication<NixSpringAppApplication>(*args)
}
