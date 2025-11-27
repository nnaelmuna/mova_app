import 'package:flutter/material.dart';
import 'package:mova_app/screens/profile_form.dart';
import 'package:mova_app/screens/widgets/choose_interest_widgets.dart';

class ChooseInterest extends StatefulWidget {
  const ChooseInterest({super.key});

  @override
  State<ChooseInterest> createState() => _ChooseInterestScreenState();
}

class _ChooseInterestScreenState extends State<ChooseInterest> {
  final List<String> _allInterests = [
    'Action', 'Drama', 'Comedy', 'Horror', 'Adventure', 'Thriller',
    'Romance', 'Science', 'Music', 'Documentary', 'Crime', 'Fantasy',
    'Mystery', 'Fiction', 'Animation', 'War', 'History', 'Television',
    'Superheroes', 'Anime', 'Sports', 'K-Drama',
  ];
  final Set<String> _selectedInterests = {};

  void _toggleInterest(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  void _onSkip() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileForm()));
  }

  void _onContinue() {
    if (_selectedInterests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose at least one interest.')),
      );
      return;
    }
    
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(width: 8),
            Text(
              'Choose Your Interest',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Choose your interests and get the best movie recommendations. Don\'t worry, you can always change it later.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                    ),
                  ),
                  SizedBox(height: 30),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _allInterests.map((interest) {
                      final isSelected = _selectedInterests.contains(interest);
                      return InterestChip(
                        label: interest,
                        isSelected: isSelected,
                        onTap: () => _toggleInterest(interest),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, ProfileForm.routeName),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: Color(0xFF1E1E1E),
                child: ActionButtons(
                  onSkip: _onSkip,
                  onContinue: _onContinue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}