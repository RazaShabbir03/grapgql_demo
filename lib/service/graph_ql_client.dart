// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  GraphQLClient? client;

  GraphQLService() {
    HttpLink link = HttpLink('https://api.mocki.io/v2/c4d7a195/graphql');

    client = GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));
  }

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic>? variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables ?? {});

    final result = await client!.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables ?? {});
    final result = await client!.mutate(options);
    return result;
  }
}
