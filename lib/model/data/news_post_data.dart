import 'package:trice/model/news/news_post.dart';

var pietro = PostAuthor("Pietro Maggi",
    "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60");
var manuel = PostAuthor("Manuel Vivo",
    "https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60");
var florina = PostAuthor("Florina Muntenescu",
    "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60");
var jose = PostAuthor("Jose Alcérreca",
    "https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60");

var publication = Publication("Android Developers",
    "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60");
var paragraphsPost1 = [
  Paragraph(
      ParagraphType.text,
      "Working to make our Android application more modular, I ended up with a sample that included a set of on-demand features grouped inside a folder:",
      []),
  Paragraph(
      ParagraphType.text,
      "Pretty standard setup, all the on-demand modules, inside a “features” folder; clean.",
      []),
  Paragraph(ParagraphType.text,
      "These modules are included in the settings.gradle file as:", []),
  Paragraph(
      ParagraphType.codeBlock,
      "include ':app'\ninclude ':features:module1'\ninclude ':features:module2'\ninclude ':features:module3'\ninclude ':features:module4'",
      []),
  Paragraph(
      ParagraphType.text,
      "These setup works nicely with a single “minor” issue: an empty module named features in the Android view in Android Studio:",
      []),
  Paragraph(
      ParagraphType.text,
      "I can live with that, but I would much prefer to remove that empty module from my project!",
      []),
  Paragraph(
      ParagraphType.header, "If you cannot remove it, just rename it!", []),
  Paragraph(
      ParagraphType.text,
      "At I/O I was lucky enough to attend the “Android Studio: Tips and Tricks” talk where Ivan Gravilovic, from Google, shared some amazing tips. One of these was a possible solution for my problem: setting a custom path for my modules.",
      [Markup(MarkupType.italic, "Android Studio: Tips and Tricks", null)]),
  Paragraph(
      ParagraphType.text,
      "In this particular case our settings.gradle becomes:",
      [Markup(MarkupType.code, "settings.gradle", null)]),
  Paragraph(ParagraphType.codeBlock, """
        include ':app'
        include ':module1'
        include ':module1'
        include ':module1'
        include ':module1'
        """, []),
  Paragraph(ParagraphType.codeBlock, """
        // Set a custom path for the four features modules.
        // This avoid to have an empty "features" module in  Android Studio.
        project(":module1").projectDir=new File(rootDir, "features/module1")
        project(":module2").projectDir=new File(rootDir, "features/module2")
        project(":module3").projectDir=new File(rootDir, "features/module3")
        project(":module4").projectDir=new File(rootDir, "features/module4")
        """, []),
  Paragraph(ParagraphType.text, "And the layout in Android Studio is now:", []),
  Paragraph(ParagraphType.header, "Conclusion", []),
  Paragraph(
      ParagraphType.text,
      "As the title says, this is really a small thing, but it helps keep my project in order and it shows how a small Gradle configuration can help keep your project tidy.",
      []),
  Paragraph(
      ParagraphType.quote,
      "You can find this update in the latest version of the on-demand modules codelab.",
      [
        Markup(MarkupType.link, "codelab",
            "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html")
      ]),
  Paragraph(ParagraphType.header, "Resources", []),
  Paragraph(
      ParagraphType.bullet, "Android Studio: Tips and Tricks (Google I/O’19)", [
    Markup(MarkupType.link, "Android Studio:",
        "https://www.youtube.com/watch?v=ihF-PwDfRZ4&list=PLWz5rJ2EKKc9FfSQIRXEWyWpHD6TtwxMM&index=32&t=0s")
  ]),
  Paragraph(ParagraphType.bullet, "On Demand module codelab", [
    Markup(MarkupType.link, "On Demand module codelab",
        "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html")
  ]),
  Paragraph(ParagraphType.bullet, "Patchwork Plaid — A modularization story", [
    Markup(MarkupType.link, "Patchwork Plaid — A modularization story",
        "https://medium.com/androiddevelopers/a-patchwork-plaid-monolith-to-modularized-app-60235d9f212e")
  ])
];

var paragraphsPost2 = [
  Paragraph(
      ParagraphType.text,
      "Dagger is a popular Dependency Injection framework commonly used in Android. It provides fully static and compile-time dependencies addressing many of the development and performance issues that have reflection-based solutions.",
      [Markup(MarkupType.link, "Dagger", "https://dagger.dev/")]),
  Paragraph(
      ParagraphType.text,
      "This month, a new tutorial was released to help you better understand how it works. This article focuses on using Dagger with Kotlin, including best practices to optimize your build time and gotchas you might encounter.",
      [
        Markup(MarkupType.link, "new tutorial", "https://dagger.dev/tutorial/"),
        Markup(MarkupType.bold, "Dagger with Kotlin", null),
        Markup(MarkupType.bold, "best practices ", null),
        Markup(MarkupType.bold, "you might", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Dagger is implemented using Java’s annotations model and annotations in Kotlin are not always directly parallel with how equivarent Java code would be written. This post will highlight areas where they differ and how you can use Dagger with Kotlin without having a headache.",
      []),
  Paragraph(
      ParagraphType.text,
      "This post was inspired by some of the suggestions in this Dagger issue that goes through best practices and pain points of Dagger in Kotlin. Thanks to all of the contributors that commented there!",
      [
        Markup(MarkupType.link, "contributors",
            "https://github.com/google/dagger/issues/900")
      ]),
  Paragraph(ParagraphType.header, "kapt build improvements", []),
  Paragraph(
      ParagraphType.text,
      "To improve your build time, Dagger added support for gradle’s incremental annotation processing in v2.18! This is enabled by default in Dagger v2.24. In case you’re using a lower version, you need to add a few lines of code (as shown below) if you want to benefit from it.",
      [
        Markup(MarkupType.link, "v2.18",
            "https://github.com/google/dagger/releases/tag/dagger-2.18"),
        Markup(MarkupType.link, "v2.24",
            "https://github.com/google/dagger/releases/tag/dagger-2.24"),
        Markup(
            MarkupType.bold,
            "Dagger added support for gradle’s incremental annotation processing ",
            null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Also, you can tell Dagger not to format the generated code. This option was added in Dagger v2.18 and it’s the default behavior (doesn’t generate formatted code) in v2.23. If you’re using a lower version, disable code formatting to improve your build time (see code below).",
      [
        Markup(MarkupType.link, "v2.18",
            "https://github.com/google/dagger/releases/tag/dagger-2.18"),
        Markup(MarkupType.link, "v2.23",
            "https://github.com/google/dagger/releases/tag/dagger-2.23")
      ]),
  Paragraph(
      ParagraphType.text,
      "Include these compiler arguments in your build.gradle file to make Dagger more performant at build time:",
      [Markup(MarkupType.code, "build.gradle", null)]),
  Paragraph(
      ParagraphType.text,
      "Alternatively, if you use Kotlin DSL script files, include them like this in the build.gradle.kts file of the modules that use Dagger:",
      [Markup(MarkupType.code, "build.gradle.kts", null)]),
  Paragraph(ParagraphType.text, "Qualifiers for field attributes", []),
  Paragraph(ParagraphType.text, "", [Markup(MarkupType.link, "", null)]),
  Paragraph(
      ParagraphType.text,
      "When an annotation is placed on a property in Kotlin, it’s not clear whether Java will see that annotation on the field of the property or the method for that property. Setting the field: prefix on the annotation ensures that the qualifier ends up in the right place (See documentation for more details).",
      [
        Markup(MarkupType.code, "prefix", null),
        Markup(MarkupType.link, "See documentation",
            "http://frogermcs.github.io/dependency-injection-with-dagger-2-custom-scopes/"),
        Markup(MarkupType.italic, "property", null),
        Markup(MarkupType.italic, "qualifier", null)
      ]),
  Paragraph(ParagraphType.text,
      "✅ The way to apply qualifiers on an injected field is:", []),
  Paragraph(
      ParagraphType.codeBlock,
      "@Inject @field:MinimumBalance lateinit var minimumBalance: BigDecimal",
      [Markup(MarkupType.bold, "@field:MinimumBalance", null)]),
  Paragraph(ParagraphType.text, "❌ As opposed to:", []),
  Paragraph(ParagraphType.codeBlock, """
        @Inject @MinimumBalance lateinit var minimumBalance: BigDecimal 
        // @MinimumBalance is ignored!
        """, [Markup(MarkupType.bold, "BigDecimal // @MinimumBalance", null)]),
  Paragraph(
      ParagraphType.text,
      "Forgetting to add field: could lead to injecting the wrong object if there’s an unqualified instance of that type available in the Dagger graph.",
      [Markup(MarkupType.code, " field", null)]),
  Paragraph(
      ParagraphType.header, "Static @Provides functions optimization", []),
  Paragraph(
      ParagraphType.text,
      "Dagger’s generated code will be more performant if @Provides methods are static. To achieve this in Kotlin, use a Kotlin object instead of a class and annotate your methods with @JvmStatic. This is a best practice that you should follow as much as possible.",
      [
        Markup(MarkupType.code, "@Provides", null),
        Markup(MarkupType.code, "static", null),
        Markup(MarkupType.code, "Kotlin", null),
        Markup(MarkupType.code, "class", null),
        Markup(MarkupType.code, "@JvmStatic", null),
        Markup(MarkupType.bold, "best practice", null),
        Markup(MarkupType.italic, "best practice", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "In case you need an abstract method, you’ll need to add the @JvmStatic method to a companion object and annotate it with @Module too.",
      [
        Markup(MarkupType.code, "@JvmStatic", null),
        Markup(MarkupType.code, "@Module", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Alternatively, you can extract the object module out and include it in the abstract one:",
      []),
  Paragraph(ParagraphType.header, "Injecting Generics", []),
  Paragraph(
      ParagraphType.text,
      "Kotlin compiles generics with wildcards to make Kotlin APIs work with Java. These are generated when a type appears as a parameter (more info here) or as fields. For example, a Kotlin List<Foo> parameter shows up as List<? super Foo> in Java.",
      [
        Markup(MarkupType.code, "parameter", null),
        Markup(MarkupType.code, "Kotlin List<Foo>", null),
        Markup(MarkupType.link, "more info here",
            "https://kotlinlang.org/docs/reference/java-to-kotlin-interop.html#variant-generics")
      ]),
  Paragraph(
      ParagraphType.text,
      "This causes problems with Dagger because it expects an exact (aka invariant) type match. Using @JvmSuppressWildcards will ensure that Dagger sees the type without wildcards.",
      [
        Markup(MarkupType.code, "@JvmSuppressWildcards", null),
        Markup(MarkupType.link, "invariant",
            "https://en.wikipedia.org/wiki/Class_invariant"),
        Markup(MarkupType.link, "JvmSuppressWildcards",
            "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.jvm/-jvm-suppress-wildcards/index.html")
      ]),
  Paragraph(
      ParagraphType.text,
      "This is a common issue when you inject collections using Dagger’s multibinding feature, for example:",
      [
        Markup(MarkupType.link, "Dagger’s multibinding feature",
            "https://dagger.dev/multibindings.html")
      ]),
  Paragraph(ParagraphType.codeBlock, """
        class MyVMFactory @Inject constructor(
          private var vmMap: Map<String, @JvmSuppressWildcards Provider<ViewModel>>
        ) { 
            ... 
        }
        """, [Markup(MarkupType.bold, "@JvmSuppressWildcards", null)]),
  Paragraph(ParagraphType.header, "Inline method bodies", []),
  Paragraph(
      ParagraphType.text,
      "Dagger determines the types that are configured by @Provides methods by inspecting the return type. Specifying the return type in Kotlin functions is optional and even the IDE sometimes encourages you to refactor your code to have inline method bodies that hide the return type declaration.",
      [Markup(MarkupType.code, "@Provides", null)]),
  Paragraph(
      ParagraphType.text,
      "This can lead to bugs if the inferred type is different from the one you meant. Let’s see some examples:",
      []),
  Paragraph(
      ParagraphType.text,
      "If you want to add a specific type to the graph, inlining works as expected. See the different ways to do the same in Kotlin:",
      []),
  Paragraph(
      ParagraphType.text,
      "If you want to provide an implementation of an interface, then you must explicitly specify the return type. Not doing it can lead to problems and bugs:",
      []),
  Paragraph(
      ParagraphType.text,
      "Dagger mostly works with Kotlin out of the box. However, you have to watch out for a few things just to make sure you’re doing what you really mean to do: @field: for qualifiers on field attributes, inline method bodies, and @JvmSuppressWildcards when injecting collections.",
      [
        Markup(MarkupType.code, "@field", null),
        Markup(MarkupType.code, "@JvmSuppressWildcards", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Dagger optimizations come with no cost, add them and follow best practices to improve your build time: enabling incremental annotation processing, disabling formatting and using static @Provides methods in your Dagger modules.",
      [Markup(MarkupType.code, "@Provides", null)])
];

var paragraphsPost3 = [
  Paragraph(
      ParagraphType.text,
      "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by following our new Refactoring to Kotlin codelab, available in English \uD83C\uDDEC\uD83C\uDDE7, Chinese \uD83C\uDDE8\uD83C\uDDF3 and Brazilian Portuguese \uD83C\uDDE7\uD83C\uDDF7.",
      [
        Markup(MarkupType.link, "English",
            "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0"),
        Markup(MarkupType.link, "Chinese",
            "https://clmirror.storage.googleapis.com/codelabs/java-to-kotlin-zh/index.html#0"),
        Markup(MarkupType.link, "Brazilian Portuguese",
            "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0")
      ]),
  Paragraph(
      ParagraphType.text,
      "When you first get started writing Kotlin code, you tend to follow Java Programming Language idioms. The automatic converter, part of both Android Studio and Intellij IDEA, can do a pretty good job of automatically refactoring your code, but sometimes, it needs a little help. This is where our new Refactoring to Kotlin codelab comes in.",
      [
        Markup(MarkupType.link, "automatic converter",
            "https://www.jetbrains.com/help/idea/converting-a-java-file-to-kotlin-file.html")
      ]),
  Paragraph(
      ParagraphType.text,
      "We’ll take two classes (a User and a Repository) in Java Programming Language and convert them to Kotlin, check out what the automatic converter did and why. Then we go to the next level — make it idiomatic, teaching best practices and useful tips along the way.",
      [
        Markup(MarkupType.code, "User", null),
        Markup(MarkupType.code, "Repository", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "The Refactoring to Kotlin codelab starts with basic topics — understand how nullability is declared in Kotlin, what types of equality are defined or how to best handle classes whose role is just to hold data. We then continue with how to handle static fields and functions in Kotlin and how to apply the Singleton pattern, with the help of one handy keyword: object. We’ll see how Kotlin helps us model our classes better, how it differentiates between a property of a class and an action the class can do. Finally, we’ll learn how to execute code only in the context of a specific object with the scope functions.",
      [
        Markup(MarkupType.code, "object", null),
        Markup(MarkupType.code, "object", null),
        Markup(MarkupType.link, "Refactoring to Kotlin",
            "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0")
      ]),
  Paragraph(
      ParagraphType.text,
      "Thanks to Walmyr Carvarho and Nelson Glauber for translating the codelab in Brazilian Portuguese!",
      [
        Markup(MarkupType.link, " translating the codelab",
            "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0")
      ]),
  Paragraph(ParagraphType.text, "", [
    Markup(MarkupType.link, "",
        "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0")
  ])
];

var paragraphsPost4 = [
  Paragraph(
      ParagraphType.text,
      "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
      []),
  Paragraph(
      ParagraphType.text,
      "In a ViewModel, if you’re exposing data coming from resources (strings, drawables, colors…), you have to take into account that ViewModel objects ignore configuration changes such as locale changes. When the user changes their locale, activities are recreated but the ViewModel objects are not.",
      [Markup(MarkupType.bold, "locale changes", null)]),
  Paragraph(
      ParagraphType.text,
      "AndroidViewModel is a subclass of ViewModel that is aware of the Application context. However, having access to a context can be dangerous if you’re not observing or reacting to the lifecycle of that context. The recommended practice is to avoid dealing with objects that have a lifecycle in ViewModels.",
      [
        Markup(MarkupType.code, "AndroidViewModel", null),
        Markup(MarkupType.code, "ViewModel", null),
        Markup(
            MarkupType.bold,
            "The recommended practice is to avoid dealing with objects that have a lifecycle in ViewModels",
            null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Let’s look at an example based on this issue in the tracker: Updating ViewModel on system locale change.",
      [
        Markup(MarkupType.link, "Updating ViewModel on system locale change",
            "https://issuetracker.google.com/issues/111961971"),
        Markup(MarkupType.italic, "Updating ViewModel on system locale change.",
            null)
      ]),
  Paragraph(
      ParagraphType.text,
      "The problem is that the string is resolved in the constructor only once. If there’s a locale change, the ViewModel won’t be recreated. This will result in our app showing obsolete data and therefore being only partially localized.",
      [
        Markup(
            MarkupType.bold,
            "If there’s a locale change, the ViewModel won’t be recreated",
            null)
      ]),
  Paragraph(
      ParagraphType.text,
      "As Sergey points out in the comments to the issue, the recommended approach is to expose the ID of the resource you want to load and do so in the view. As the view (activity, fragment, etc.) is lifecycle-aware it will be recreated after a configuration change so the resource will be reloaded correctly.",
      [
        Markup(MarkupType.link, "Sergey", "https://twitter.com/ZelenetS"),
        Markup(MarkupType.link, "approach",
            "https://issuetracker.google.com/issues/111961971#comment2"),
        Markup(
            MarkupType.bold,
            "As the view (activity, fragment, etc.) is lifecycle-aware it will be recreated after a configuration change so the resource will be reloaded correctly.",
            null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Even if you don’t plan to localize your app, it makes testing much easier and cleans up your ViewModel objects so there’s no reason not to future-proof.",
      []),
  Paragraph(
      ParagraphType.text,
      "We fixed this issue in the android-architecture repository in the Java and Kotlin branches and we offloaded resource loading to the Data Binding layout.",
      [
        Markup(MarkupType.link, "Java",
            "https://github.com/googlesamples/android-architecture/pull/631"),
        Markup(MarkupType.link, "Kotlin",
            "https://github.com/googlesamples/android-architecture/pull/635"),
        Markup(MarkupType.link, "Data Binding layout",
            "https://github.com/googlesamples/android-architecture/pull/635/files#diff-7eb5d85ec3ea4e05ecddb7dc8ae20aa1R62")
      ])
];

var paragraphsPost5 = [
  Paragraph(
      ParagraphType.text,
      "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of working with collections based on how they’re evaruated: eagerly — with Collections, and lazily — with Sequences. Continue reading to find out what’s the difference between the two, which one you should use and when, and what the performance implications of each are.",
      [
        Markup(MarkupType.code, "Collections", null),
        Markup(MarkupType.code, "Sequences", null),
        Markup(MarkupType.link, "Collections",
            "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/index.html"),
        Markup(MarkupType.link, "Sequences",
            "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.sequences/index.html"),
        Markup(MarkupType.bold, "eagerly", null),
        Markup(MarkupType.bold, "lazily", null),
        Markup(MarkupType.bold, "with", null),
        Markup(MarkupType.italic, "with", null)
      ]),
  Paragraph(ParagraphType.header, "Collections vs sequences", []),
  Paragraph(
      ParagraphType.text,
      "The difference between eager and lazy evaruation lies in when each transformation on the collection is performed.",
      [Markup(MarkupType.italic, "lazy", null)]),
  Paragraph(
      ParagraphType.text,
      "Collections are eagerly evaruated — each operation is performed when it’s called and the result of the operation is stored in a new collection. The transformations on collections are inline functions. For example, looking at how map is implemented, we can see that it’s an inline function, that creates a new ArrayList:",
      [
        Markup(MarkupType.code, "map", null),
        Markup(MarkupType.code, "inline", null),
        Markup(MarkupType.code, "ArrayList", null),
        Markup(MarkupType.link, "inline functions",
            "https://kotlinlang.org/docs/reference/inline-functions.html"),
        Markup(MarkupType.link, "collection",
            "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Collections.kt#L1312"),
        Markup(MarkupType.bold, "Collections", null),
        Markup(MarkupType.italic, "eagerly", null)
      ]),
  Paragraph(
      ParagraphType.codeBlock,
      "public inline fun <T, R> Iterable<T>.map(transform: (T) -> R): List<R> {\n  return mapTo(ArrayList<R>(collectionSizeOrDefault(10)), transform)\n}",
      [
        Markup(MarkupType.bold, "inline", null),
        Markup(MarkupType.bold, "ArrayList", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Sequences are lazily evaruated. They have two types of operations: intermediate and terminal. Intermediate operations are not performed on the spot; they’re just stored. Only when a terminal operation is called, the intermediate operations are triggered on each element in a row and finally, the terminal operation is applied. Intermediate operations (like map, distinct, groupBy etc) return another sequence whereas terminal operations (like first, toList, count etc) don’t.",
      [
        Markup(MarkupType.code, "row", null),
        Markup(MarkupType.code, "Intermediate", null),
        Markup(MarkupType.code, "operations", null),
        Markup(MarkupType.code, "sequence", null),
        Markup(MarkupType.code, "terminal", null),
        Markup(MarkupType.code, "return", null),
        Markup(MarkupType.bold, "Sequences", null),
        Markup(MarkupType.bold, "intermediate", null),
        Markup(MarkupType.bold, "terminal", null),
        Markup(MarkupType.bold, "Intermediate", null),
        Markup(MarkupType.italic, "lazily", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Sequences don’t hold a reference to the items of the collection. They’re created based on the iterator of the original collection and keep a reference to all the intermediate operations that need to be performed.",
      []),
  Paragraph(
      ParagraphType.text,
      "Unlike transformations on collections, intermediate transformations on sequences are not inline functions — inline functions cannot be stored and sequences need to store them. Looking at how an intermediate operation like map is implemented, we can see that the transform function is kept in a new instance of a Sequence:",
      [
        Markup(MarkupType.code, "map", null),
        Markup(MarkupType.code, "function", null),
        Markup(MarkupType.link, "Sequence",
            "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L860")
      ]),
  Paragraph(
      ParagraphType.codeBlock,
      "public fun <T, R> Sequence<T>.map(transform: (T) -> R): Sequence<R>{      \n   return TransformingSequence(this, transform)\n}",
      [Markup(MarkupType.bold, "TransformingSequence", null)]),
  Paragraph(
      ParagraphType.text,
      "A terminal operation, like first, iterates through the elements of the sequence until the predicate condition is matched.",
      [
        Markup(MarkupType.code, "first", null),
        Markup(MarkupType.link, "first",
            "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L117")
      ]),
  Paragraph(
      ParagraphType.codeBlock,
      "public inline fun <T> Sequence<T>.first(predicate: (T) -> Boolean): T {\n   for (element in this) if (predicate(element)) return element\n   throw NoSuchElementException(“Sequence contains no element matching the predicate.”)\n}",
      []),
  Paragraph(
      ParagraphType.text,
      "If we look at how a sequence like TransformingSequence (used in the map above) is implemented, we’ll see that when next is called on the sequence iterator, the transformation stored is also applied.",
      [
        Markup(MarkupType.code, "TransformingSequence", null),
        Markup(MarkupType.code, "iterator", null)
      ]),
  Paragraph(
      ParagraphType.codeBlock,
      "internal class TransformingIndexedSequence<T, R> \n constructor(private var sequence: Sequence<T>, private var transformer: (Int, T) -> R) : Sequence<R> {",
      [Markup(MarkupType.bold, "transformer", null)]),
  Paragraph(
      ParagraphType.codeBlock,
      "override fun iterator(): Iterator<R> = object : Iterator<R> {\n   …\n   override fun next(): R {\n     return transformer(checkIndexOverflow(index++), iterator.next())\n   }\n   …\n}",
      [
        Markup(MarkupType.bold, "next()", null),
        Markup(MarkupType.bold, "transformer", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Independent on whether you’re using collections or sequences, the Kotlin Standard Library offers quite a wide range of operations for both, like find, filter, groupBy and others. Make sure you check them out, before implementing your own version of these.",
      [
        Markup(MarkupType.code, "find", null),
        Markup(MarkupType.code, "filter", null),
        Markup(MarkupType.code, "groupBy", null),
        Markup(MarkupType.link, "check them out",
            "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/#functions")
      ]),
  Paragraph(ParagraphType.header, "Collections and sequences", []),
  Paragraph(
      ParagraphType.text,
      "Let’s say that we have a list of objects of different shapes. We want to make the shapes yellow and then take the first square shape.",
      []),
  Paragraph(
      ParagraphType.text,
      "Let’s see how and when each operation is applied for collections and when for sequences",
      []),
  Paragraph(ParagraphType.subHead, "Collections", []),
  Paragraph(
      ParagraphType.text,
      "map is called — a new ArrayList is created. We iterate through all items of the initial collection, transform it by copying the original object and changing the color, then add it to the new list.",
      [Markup(MarkupType.code, "map", null)]),
  Paragraph(
      ParagraphType.text,
      "first is called — we iterate through each item until the first square is found",
      [Markup(MarkupType.code, "first", null)]),
  Paragraph(ParagraphType.subHead, "Sequences", []),
  Paragraph(
      ParagraphType.bullet,
      "asSequence — a sequence is created based on the Iterator of the original collection",
      [Markup(MarkupType.code, "asSequence", null)]),
  Paragraph(
      ParagraphType.bullet,
      "map is called — the transformation is added to the list of operations needed to be performed by the sequence but the operation is NOT performed",
      [
        Markup(MarkupType.code, "map", null),
        Markup(MarkupType.bold, "NOT", null)
      ]),
  Paragraph(
      ParagraphType.bullet,
      "first is called — this is a terminal operation, so, all the intermediate operations are triggered, on each element of the collection. We iterate through the initial collection applying map and then first on each of them. Since the condition from first is satisfied by the 2nd element, then we no longer apply the map on the rest of the collection.",
      [Markup(MarkupType.code, "first", null)]),
  Paragraph(
      ParagraphType.text,
      "When working with sequences no intermediate collection is created and since items are evaruated one by one, map is only performed on some of the inputs.",
      []),
  Paragraph(ParagraphType.header, "Performance", []),
  Paragraph(ParagraphType.subHead, "Order of transformations", []),
  Paragraph(
      ParagraphType.text,
      "Independent of whether you’re using collections or sequences, the order of transformations matters. In the example above, first doesn’t need to happen after map since it’s not a consequence of the map transformation. If we reverse the order of our business logic and call first on the collection and then transform the result, then we only create one new object — the yellow square. When using sequences — we avoid creating 2 new objects, when using collections, we avoid creating an entire new list.",
      [
        Markup(MarkupType.code, "first", null),
        Markup(MarkupType.code, "map", null),
        Markup(MarkupType.code, "not", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Because terminal operations can finish processing early, and intermediate operations are evaruated lazily, sequences can, in some cases, help you avoid doing unnecessary work compared to collections. Make sure you always check the order of the transformations and the dependencies between them!",
      []),
  Paragraph(
      ParagraphType.subHead, "Inlining and large data sets consequences", []),
  Paragraph(
      ParagraphType.text,
      "Collection operations use inline functions, so the bytecode of the operation, together with the bytecode of the lambda passed to it will be inlined. Sequences don’t use inline functions, therefore, new Function objects are created for each operation.",
      [Markup(MarkupType.code, "objects", null)]),
  Paragraph(
      ParagraphType.text,
      "On the other hand, collections create a new list for every transformation while sequences just keep a reference to the transformation function.",
      []),
  Paragraph(
      ParagraphType.text,
      "When working with small collections, with 1–2 operators, these differences don’t have big implications so working with collections should be ok. But, when working with large lists the intermediate collection creation can become expensive; in such cases, use sequences.",
      [
        Markup(MarkupType.bold, "big implications", null),
        Markup(MarkupType.bold, "collections", null),
        Markup(MarkupType.bold, "creation", null),
        Markup(MarkupType.bold, "sequences", null)
      ]),
  Paragraph(
      ParagraphType.text,
      "Unfortunately, I’m not aware of any benchmarking study done that would help us get a better understanding on how the performance of collections vs sequences is affected with different sizes of collections or operation chains.",
      []),
  Paragraph(
      ParagraphType.text,
      "Collections eagerly evaruate your data while sequences do so lazily. Depending on the size of your data, pick the one that fits best: collections — for small lists or sequences — for larger ones, and pay attention to the order of the transformations.",
      [])
];

var post1 = NewsPostModel(
    id: "dc523f0ed25c",
    title: "A Little Thing about Android Module Paths",
    subtitle:
        "How to configure your module paths, instead of using Gradle’s default.",
    url:
        "https://medium.com/androiddevelopers/gradle-path-configuration-dc523f0ed25c",
    publication: publication,
    metadata: Metadata(pietro, "August 02", 1),
    paragraphs: paragraphsPost1,
    imageId:
        "https://images.unsplash.com/photo-1624594593821-c6fdf3ea69ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHVpfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    imageThumbId: "R.drawable.post_1_thumb");

var post2 = NewsPostModel(
    id: "7446d8dfd7dc",
    title: "Dagger in Kotlin: Gotchas and Optimizations",
    subtitle:
        "Use Dagger in Kotlin! This article includes best practices to optimize your build time and gotchas you might encounter.",
    url:
        "https://medium.com/androiddevelopers/dagger-in-kotlin-gotchas-and-optimizations-7446d8dfd7dc",
    publication: publication,
    metadata: Metadata(manuel, "July 30", 3),
    paragraphs: paragraphsPost2,
    imageId:
        "https://images.unsplash.com/photo-1644329968124-4c68f17c21e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8dWl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    imageThumbId: "R.drawable.post_2_thumb");

var post3 = NewsPostModel(
    id: "ac552dcc1741",
    title: "From Java Programming Language to Kotlin — the idiomatic way",
    subtitle:
        "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by…",
    url:
        "https://medium.com/androiddevelopers/from-java-programming-language-to-kotlin-the-idiomatic-way-ac552dcc1741",
    publication: publication,
    metadata: Metadata(florina, "July 09", 1),
    paragraphs: paragraphsPost3,
    imageId:
        "https://images.unsplash.com/photo-1581287053822-fd7bf4f4bfec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dWl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    imageThumbId: "R.drawable.post_3_thumb");

var post4 = NewsPostModel(
    id: "84eb677660d9",
    title: "Locale changes and the AndroidViewModel antipattern",
    subtitle:
        "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
    url:
        "https://medium.com/androiddevelopers/locale-changes-and-the-androidviewmodel-antipattern-84eb677660d9",
    publication: publication,
    metadata: Metadata(jose, "April 02", 1),
    paragraphs: paragraphsPost4,
    imageId:
        "https://images.unsplash.com/photo-1638864615951-360884c3a277?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHVpfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    imageThumbId: "R.drawable.post_4_thumb");

var post5 = NewsPostModel(
    id: "55db18283aca",
    title: "Collections and sequences in Kotlin",
    subtitle:
        "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of…",
    url:
        "https://medium.com/androiddevelopers/collections-and-sequences-in-kotlin-55db18283aca",
    publication: publication,
    metadata: Metadata(florina, "July 24", 4),
    paragraphs: paragraphsPost5,
    imageId:
        "https://images.unsplash.com/photo-1603969280040-3bbb77278211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    imageThumbId: "R.drawable.post_5_thumb");

var posts = [
  post1,
  post2,
  post3,
  post5,
  post1.copyWith(id: "post6"),
  post2.copyWith(id: "post7"),
  post3.copyWith(id: "post8"),
  post4.copyWith(id: "post9"),
  post5.copyWith(id: "post10"),
];
