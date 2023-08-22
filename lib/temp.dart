
backgroundColor: CupertinoColors.systemBackground,
//
appBar: AppBar(
  leading: Icon(Icons.keyboard_backspace_rounded, color: CupertinoColors.black,),
  title: fontAppbar(text: 'Study Room', color: CupertinoColors.black,),
  elevation: 0,
  backgroundColor: Colors.transparent,
),

body: CustomScrollView(
slivers: [
SliverAppBar(
pinned: true,
floating: true,
snap: false,
)
],
)
Container(
  width: double.infinity,
  child: const Column(
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(image: AssetImage('assets/hometop.jpg')),
      )
    ],
  ),
),
);