import 'package:artemis/generator/data.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  group('On types not used by interfaces', () {
    testGenerator(
      description: 'Those other types are not considered nor generated',
      query: query,
      libraryDefinition: libraryDefinition,
      generatedFile: generatedFile,
      stringSchema: stringSchema,
    );
  });
}

const query = r'''
query custom($id: ID!) {
  nodeById(id: $id) {
    id
    ... on User {
      username
    }
    ... on ChatMessage {
      message
    }
  }
}
''';

// https://graphql-code-generator.com/#live-demo
final graphQLSchema = '''
scalar String
scalar ID

schema {
  query: Query
}

type Query {
  nodeById(id: ID!): Node
}

interface Node {
  id: ID!
}

type User implements Node {
  id: ID!
  username: String!
}

type OtherEntity implements Node {
  id: ID!
  test: String!
}

type ChatMessage implements Node {
  id: ID!
  message: String!
  user: User!
}
''';

const stringSchema = r'''
{
    "__schema": {
        "queryType": {
            "name": "Query"
        },
        "mutationType": null,
        "subscriptionType": null,
        "types": [
            {
                "kind": "OBJECT",
                "name": "Query",
                "description": null,
                "fields": [
                    {
                        "name": "nodeById",
                        "description": null,
                        "args": [
                            {
                                "name": "id",
                                "description": null,
                                "type": {
                                    "kind": "NON_NULL",
                                    "name": null,
                                    "ofType": {
                                        "kind": "SCALAR",
                                        "name": "ID",
                                        "ofType": null
                                    }
                                },
                                "defaultValue": null
                            }
                        ],
                        "type": {
                            "kind": "INTERFACE",
                            "name": "Node",
                            "ofType": null
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    }
                ],
                "inputFields": null,
                "interfaces": [],
                "enumValues": null,
                "possibleTypes": null
            },
            {
                "kind": "INTERFACE",
                "name": "Node",
                "description": null,
                "fields": [
                    {
                        "name": "id",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "SCALAR",
                                "name": "ID",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    }
                ],
                "inputFields": null,
                "interfaces": null,
                "enumValues": null,
                "possibleTypes": [
                    {
                        "kind": "OBJECT",
                        "name": "User",
                        "ofType": null
                    },
                    {
                        "kind": "OBJECT",
                        "name": "ChatMessage",
                        "ofType": null
                    },
                    {
                        "kind": "OBJECT",
                        "name": "OtherEntity",
                        "ofType": null
                    }
                ]
            },
            {
                "kind": "OBJECT",
                "name": "User",
                "description": null,
                "fields": [
                    {
                        "name": "id",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "SCALAR",
                                "name": "ID",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    },
                    {
                        "name": "username",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "SCALAR",
                                "name": "String",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    }
                ],
                "inputFields": null,
                "interfaces": [
                    {
                        "kind": "INTERFACE",
                        "name": "Node",
                        "ofType": null
                    }
                ],
                "enumValues": null,
                "possibleTypes": null
            },
            {
                "kind": "OBJECT",
                "name": "OtherEntity",
                "description": null,
                "fields": [
                    {
                        "name": "id",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "SCALAR",
                                "name": "ID",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    },
                    {
                        "name": "test",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "SCALAR",
                                "name": "String",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    }
                ],
                "inputFields": null,
                "interfaces": [
                    {
                        "kind": "INTERFACE",
                        "name": "Node",
                        "ofType": null
                    }
                ],
                "enumValues": null,
                "possibleTypes": null
            },
            {
                "kind": "OBJECT",
                "name": "ChatMessage",
                "description": null,
                "fields": [
                    {
                        "name": "id",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "SCALAR",
                                "name": "ID",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    },
                    {
                        "name": "message",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "SCALAR",
                                "name": "String",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    },
                    {
                        "name": "user",
                        "description": null,
                        "args": [],
                        "type": {
                            "kind": "NON_NULL",
                            "name": null,
                            "ofType": {
                                "kind": "OBJECT",
                                "name": "User",
                                "ofType": null
                            }
                        },
                        "isDeprecated": false,
                        "deprecationReason": null
                    }
                ],
                "inputFields": null,
                "interfaces": [
                    {
                        "kind": "INTERFACE",
                        "name": "Node",
                        "ofType": null
                    }
                ],
                "enumValues": null,
                "possibleTypes": null
            },
            {
                "kind": "SCALAR",
                "name": "String",
                "description": "The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.",
                "fields": null,
                "inputFields": null,
                "interfaces": null,
                "enumValues": null,
                "possibleTypes": null
            },
            {
                "kind": "SCALAR",
                "name": "ID",
                "description": "The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `\"4\"`) or integer (such as `4`) input value will be accepted as an ID.",
                "fields": null,
                "inputFields": null,
                "interfaces": null,
                "enumValues": null,
                "possibleTypes": null
            }
        ],
        "directives": []
    }
}
''';

final libraryDefinition = LibraryDefinition(basename: r'query', queries: [
  QueryDefinition(
      queryName: r'custom',
      queryType: r'Custom$Query',
      classes: [
        ClassDefinition(
            name: r'Custom$Query$Node$User',
            properties: [
              ClassProperty(
                  type: r'String',
                  name: r'username',
                  isOverride: false,
                  isNonNull: true)
            ],
            extension: r'Custom$Query$Node',
            factoryPossibilities: {},
            typeNameField: r'__typename',
            isInput: false),
        ClassDefinition(
            name: r'Custom$Query$Node$ChatMessage',
            properties: [
              ClassProperty(
                  type: r'String',
                  name: r'message',
                  isOverride: false,
                  isNonNull: true)
            ],
            extension: r'Custom$Query$Node',
            factoryPossibilities: {},
            typeNameField: r'__typename',
            isInput: false),
        ClassDefinition(
            name: r'Custom$Query$Node',
            properties: [
              ClassProperty(
                  type: r'String',
                  name: r'id',
                  isOverride: false,
                  isNonNull: true),
              ClassProperty(
                  type: r'String',
                  name: r'typeName',
                  isOverride: true,
                  annotation: r'''JsonKey(name: '__typename')''',
                  isNonNull: false)
            ],
            factoryPossibilities: {
              r'User': r'Custom$Query$Node$User',
              r'ChatMessage': r'Custom$Query$Node$ChatMessage'
            },
            typeNameField: r'__typename',
            isInput: false),
        ClassDefinition(
            name: r'Custom$Query',
            properties: [
              ClassProperty(
                  type: r'Custom$Query$Node',
                  name: r'nodeById',
                  isOverride: false,
                  isNonNull: false)
            ],
            factoryPossibilities: {},
            typeNameField: r'__typename',
            isInput: false)
      ],
      inputs: [QueryInput(type: r'String', name: r'id', isNonNull: true)],
      generateHelpers: false)
]);

const generatedFile = r'''// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'query.g.dart';

@JsonSerializable(explicitToJson: true)
class Custom$Query$Node$User extends Custom$Query$Node with EquatableMixin {
  Custom$Query$Node$User();

  factory Custom$Query$Node$User.fromJson(Map<String, dynamic> json) =>
      _$Custom$Query$Node$UserFromJson(json);

  String username;

  @override
  List<Object> get props => [username];
  Map<String, dynamic> toJson() => _$Custom$Query$Node$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Custom$Query$Node$ChatMessage extends Custom$Query$Node
    with EquatableMixin {
  Custom$Query$Node$ChatMessage();

  factory Custom$Query$Node$ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$Custom$Query$Node$ChatMessageFromJson(json);

  String message;

  @override
  List<Object> get props => [message];
  Map<String, dynamic> toJson() => _$Custom$Query$Node$ChatMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Custom$Query$Node with EquatableMixin {
  Custom$Query$Node();

  factory Custom$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return Custom$Query$Node$User.fromJson(json);
      case r'ChatMessage':
        return Custom$Query$Node$ChatMessage.fromJson(json);
      default:
    }
    return _$Custom$Query$NodeFromJson(json);
  }

  String id;

  @override
  @JsonKey(name: '__typename')
  String typeName;

  @override
  List<Object> get props => [id, typeName];
  Map<String, dynamic> toJson() {
    switch (typeName) {
      case r'User':
        return (this as Custom$Query$Node$User).toJson();
      case r'ChatMessage':
        return (this as Custom$Query$Node$ChatMessage).toJson();
      default:
    }
    return _$Custom$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Custom$Query with EquatableMixin {
  Custom$Query();

  factory Custom$Query.fromJson(Map<String, dynamic> json) =>
      _$Custom$QueryFromJson(json);

  Custom$Query$Node nodeById;

  @override
  List<Object> get props => [nodeById];
  Map<String, dynamic> toJson() => _$Custom$QueryToJson(this);
}
''';
