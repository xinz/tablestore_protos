# TableStoreProtos

**Alibaba TableStore Service's proto files for Elixir.**

### How to use:

1, Run `brew install protobuf` on MacOS or similar command(s) to install `protobuf` in local.

2, Use [protox](https://hex.pm/packages/protox) as the Elixir protobuf library (`protox` requires `~> 1.2.4`), to generate the 
modules from `protos/*.proto` files, in the root directory of this repo run the corresponding command as below:

```
mix protox.generate --keep-unknown-fields=false --multiple-files --output-path=lib --include-path=. protos/*.proto
```

3, The generated `lib/*.ex` files will be used by [Alibaba TableStore Elixir SDK](https://hex.pm/packages/ex_aliyun_ots) as a dependence.
