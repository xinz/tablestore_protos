# TablestoreProtos

**Alibaba Tablestore Service's proto files**

### How to use:

1, Run `brew install protobuf` on MacOS.

2, Use `protobuf-elixir` latest master branch to run `mix escript.build` to generate an available cli application `protoc-gen-elixir`, and then put it into your local `~/.mix/escripts/protoc-gen-elixir`. 

Notice: this step can be ignored in the feture, since run `mix escript.install hex protobuf` will generated for 0.7.1 version, but we would like to use the master branch `src/elixirpb.proto` for module prefix defination.

3, In the repo root directory, generate codes from `protos/*.proto`

```
protoc -I protos --elixir_out=./lib protos/*.proto
```
