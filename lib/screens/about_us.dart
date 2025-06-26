import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('عن التطبيق'), centerTitle: true),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'مرحبًا بك في Reservision – رفيقك الذكي لعالم الملاعب!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SelectableText(
                '''
      📱 هل تبحث عن ملعب قريب لحجزه بسهولة؟  
      ⚽ هل تود تنظيم مباراة مع أصدقائك دون عناء التنسيق؟  
      مع Reservision، صار كل ذلك ممكنًا… بنقرة واحدة فقط!
      
      🔍 تصفح مئات الملاعب في مدينتك  
      🗓️ احجز الموعد الذي يناسبك فورًا  
      ⭐ شاهد تقييمات اللاعبين قبلك  
      📍 استعرض الخدمات، الصور، والموقع  
      🧾 واحتفظ بكل حجوزاتك في مكان واحد
      ''',
                style: TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20),
              Text(
                'لماذا Reservision؟',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 10),
              SelectableText('''
      - لأننا نؤمن أن الرياضة للجميع.
      - ولأننا نريد أن نجعل الوصول إلى الملاعب أسهل، وأسرع، وأكثر احترافية.
      - ولأننا نساعد أصحاب الملاعب على تنظيم حجوزاتهم وزيادة دخلهم.
      ''', style: TextStyle(fontSize: 16, height: 1.6)),
              SizedBox(height: 20),
              Text(
                '🎯 هدفنا:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'أن نبني مجتمعًا رياضيًا صحيًا… منظمًا… ومتصلًا بتقنية المستقبل.',
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  '🚀 حمل التطبيق الآن، وابدأ تجربتك الرياضية الذكية!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
