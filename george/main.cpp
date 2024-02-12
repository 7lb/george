#include <iostream>

#include <george/test.hpp>
#include <flecs.h>

int main()
{
	std::cout << "Hello, world! " << GeorgeTest::getFive() << std::endl;

	flecs::world world;
	auto e = world.entity("Bob");

	std::cout << "Entity name: " << e.name() << std::endl;

	return 0;
}
