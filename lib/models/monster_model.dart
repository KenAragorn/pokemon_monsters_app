import 'package:flutter/material.dart';

class MonsterModel {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;
  final List<String> gifPaths;
  final String videoClipPath;

  MonsterModel(
      {this.name,
      this.imagePath,
      this.description,
      this.colors,
      this.gifPaths,
      this.videoClipPath});
}

List monsters = [
  MonsterModel(
      name: "Charmander",
      imagePath: "assets/images/charmander.png",
      description:
          "Charmander is a small, bipedal, dinosaur-like Pokémon. Most of its body is colored orange, while its underbelly is a pale light-yellow color.",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
      gifPaths: [
        "assets/images/charmander_big_fire.gif",
        "assets/images/charmander_flame_around.gif",
        "assets/images/charmander_mini_flames.gif",
        "assets/images/charmander_evolve.gif",
        "assets/images/charmander_idle.gif",
        "assets/images/charmander_smile.gif"
      ],
      videoClipPath: "assets/images/charmander_flamethrower.mp4"),
  MonsterModel(
      name: "Squirtle",
      imagePath: "assets/images/squirtle.png",
      description:
          "Squirtle is a small, light-blue Pokémon with an appearance similar to a turtle.",
      colors: [
        Colors.lightBlueAccent.shade200,
        Colors.lightBlueAccent.shade400
      ],
      gifPaths: [
        "assets/images/squirtle_fire.gif",
        "assets/images/squirtle_burst_fire.gif",
        "assets/images/squirtle_bubble_attack.gif",
        "assets/images/squirtle_air.gif",
        "assets/images/squirtle_dance.gif",
      ],
      videoClipPath: "assets/images/squirtle_fight.mp4"),
//  MonsterModel(
//      name: "Sandshrew",
//      imagePath: "assets/images/sandshrew.png",
//      description:
//          "Sandshrew it is one of Gru and Lucy's three adopted daughters, alongside her sisters Margo and Edith. She is the youngest child of the three sisters. She greatly adores unicorns, as shown on various occasions. Agnes is a little girl with dark brown eyes. Her long black hair is tied in an upwards ponytail with a red scrunchie. Most of the time, Agnes wears blue overalls over a yellow and brown striped t-shirt, and white sneakers with yellow socks. She also wears a white ballet outfit like Edith and Margo (at the ballet recital). For pajamas, Agnes wears a long blue nightshirt covered with teddy bears and polar bear slippers; her hair stays the same. On her birthday, Agnes is wearing a dress that resembles a princess riding a unicorn. The colors are similar to her regular outfit. She also wears a blue princess hat on her head.",
//      colors: [Colors.yellow.shade400, Colors.yellow.shade800]),
  MonsterModel(
      name: "Bulbasaur",
      imagePath: "assets/images/bulbasaur.png",
      description:
          "Bulbasaur resembles a small, squatting dinosaur that walks on four legs, but bears three claws on each of its feet and has no tail.",
      colors: [Colors.lightGreen.shade200, Colors.lightGreen.shade700],
      gifPaths: [
        "assets/images/bulbasaur_burst.gif",
        "assets/images/bulbasaur_running.gif",
        "assets/images/bulbasaur_flowers.gif",
        "assets/images/bulbasaur_spray.gif",
        "assets/images/bulbasaur_cable.gif",
      ],
      videoClipPath: "assets/images/bulbasaur_fighting.mp4"),
  MonsterModel(
      name: "Lugia",
      imagePath: "assets/images/lugia.png",
      description:
          "Lugia is one of the Legendary Pokemon. It is the Version Mascot for Pokemon Silver.",
      colors: [Colors.blueAccent.shade200, Colors.blueAccent.shade700],
      gifPaths: [
        "assets/images/lugia_burst_out.gif",
        "assets/images/lugia_fire.gif",
        "assets/images/lugia_spray.gif",
        "assets/images/lugia_flying.gif",
        "assets/images/lugia_turning.gif",
        "assets/images/lugia_been_attack.gif",
      ],
      videoClipPath: "assets/images/lugia.mp4"),
  MonsterModel(
      name: "Pikachu",
      imagePath: "assets/images/pikachu.png",
      description:
          "Pikachu is renowned for being the most well-known and recognizable Pokémon.",
      colors: [Colors.red.shade200, Colors.red.shade400],
      gifPaths: [
        "assets/images/pikachu_lighting_ball.gif",
        "assets/images/pikachu_run.gif",
        "assets/images/pikachu_sky_attack.gif",
        "assets/images/pikachu_extra_light.gif",
      ],
      videoClipPath: "assets/images/pikachu_fight.mp4"),
  MonsterModel(
      name: "Raikou",
      imagePath: "assets/images/raikou.png",
      description:
          "Raikou is a quadruped, yellow feline Pokémon with black stripes on its body. Its iris is red in color with a black pupil. ",
      colors: [Colors.pink.shade200, Colors.pink.shade400],
      gifPaths: [
        "assets/images/raikou_dark_cloud.gif",
        "assets/images/raikou_jump.gif",
        "assets/images/raikou_burst.gif",
        "assets/images/raikou_body.gif",
      ],
      videoClipPath: "assets/images/raikou.mp4"),
  MonsterModel(
      name: "Mewtwo",
      imagePath: "assets/images/mewtwo.png",
      description:
      "Mewtwo is a Psychic-type Legendary Pokémon introduced in Generation I. It was created using Mew's DNA.",
      colors: [Colors.purple.shade200, Colors.purple.shade400],
      gifPaths: [
        "assets/images/mewtwo_fire.gif",
        "assets/images/mewtwo_burst_fire.gif",
        "assets/images/mewtwo_fight.gif",
      ],
      videoClipPath: "assets/images/mewtwo.mp4"),
  MonsterModel(
      name: "Charizard",
      imagePath: "assets/images/charizard.png",
      description:
          "Charizard is a large, dragon-like Pokémon that differs greatly from its pre-evolved form. ",
      colors: [Colors.yellow.shade400, Colors.yellow.shade800],
      gifPaths: [
        "assets/images/charizard_prepare_fire.gif",
        "assets/images/charizard_ball_flame.gif",
        "assets/images/charizard_changed.gif",
        "assets/images/charizard_tail.gif",
        "assets/images/charizard_funny.gif",
      ],
      videoClipPath: "assets/images/charizard.mp4"),
//  MonsterModel(
//      name: "Snorlax",
//      imagePath: "assets/images/snorlax.png",
//      description:
//          "Snorlax is one of the Minions and the protagonist in the film Minions. Kevin is a tall, two-eyed minion with sprout cut hair and is usually seen wearing his golf apparel. Kevin loves to make fun of and tease people or Minions, shown when he made fun of Jerry and teases him for being a coward. He loves playing golf and cricket. In the film Minions he is the leader of the trio in search of a new master. He truly cares about the well-being of the Minion tribe (which is dependent on them having a proper master).",
//      colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade400]),
//  MonsterModel(
//      name: "Caterpie",
//      imagePath: "assets/images/caterpie.png",
//      description:
//          "Caterpie is one of the Minions and the protagonist in the film Minions. Kevin is a tall, two-eyed minion with sprout cut hair and is usually seen wearing his golf apparel. Kevin loves to make fun of and tease people or Minions, shown when he made fun of Jerry and teases him for being a coward. He loves playing golf and cricket. In the film Minions he is the leader of the trio in search of a new master. He truly cares about the well-being of the Minion tribe (which is dependent on them having a proper master).",
//      colors: [Colors.lightGreen.shade200, Colors.lightGreen.shade400]),
  MonsterModel(
      name: "Jolteon",
      imagePath: "assets/images/jolteon.png",
      description:
          "Jolteon is an Electric-type Pokémon introduced in Generation I.",
      colors: [Colors.brown.shade100, Colors.brown.shade300],
      gifPaths: [
        "assets/images/jolteon_flash.gif",
        "assets/images/jolteon_elec_burst.gif",
        "assets/images/jolteon_small_elec.gif",
        "assets/images/jolteon_ready.gif",
        "assets/images/jolteon_fire_burst.gif",
      ],
      videoClipPath: "assets/images/jolteon.mp4"),
];
