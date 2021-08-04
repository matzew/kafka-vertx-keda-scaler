package net.wessendorf.kafka.starter;

import io.vertx.core.Vertx;

public class Runner {

  public static void main(String... args) throws Exception {

    final Vertx vertx = Vertx.vertx();
    vertx.deployVerticle(new MainVerticle());
  }
}
