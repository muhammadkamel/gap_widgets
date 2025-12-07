import 'package:flutter/material.dart';
import 'package:gap_plus/gap_plus.dart';

void main() {
  runApp(const GapPlusExampleApp());
}

class GapPlusExampleApp extends StatelessWidget {
  const GapPlusExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gap Plus Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const GapPlusExamplesPage(),
    );
  }
}

class GapPlusExamplesPage extends StatelessWidget {
  const GapPlusExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gap Plus Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              '1. Gap in Row (Horizontal)',
              'Gap takes width in a Row',
              Row(
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const Gap(20),
                  Container(width: 50, height: 50, color: Colors.green),
                  const Gap(30),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),
            _buildSection(
              context,
              '2. Gap in Column (Vertical)',
              'Gap takes height in a Column',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const Gap(20),
                  Container(width: 50, height: 50, color: Colors.green),
                  const Gap(30),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),
            _buildSection(
              context,
              '3. Gap with crossAxisExtent',
              'Gap with specified cross-axis dimension',
              Row(
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const Gap(20, crossAxisExtent: 30),
                  Container(width: 50, height: 50, color: Colors.green),
                ],
              ),
            ),
            _buildSection(
              context,
              '4. Gap.expand',
              'Gap that expands in cross-axis direction',
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Container(width: 50, height: 50, color: Colors.red),
                    const Gap.expand(20, color: Colors.yellow),
                    Container(width: 50, height: 50, color: Colors.green),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '5. Gap with color',
              'Gap with background color for visualization',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const Gap(20, color: Colors.purple),
                  Container(width: 50, height: 50, color: Colors.green),
                ],
              ),
            ),
            _buildSection(
              context,
              '6. MaxGap in Row (Unconstrained)',
              'MaxGap takes full specified space when unconstrained',
              Row(
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const MaxGap(100, crossAxisExtent: 30, color: Colors.orange),
                  Container(width: 50, height: 50, color: Colors.green),
                ],
              ),
            ),
            _buildSection(
              context,
              '7. MaxGap in Row (Constrained)',
              'MaxGap shrinks when constrained',
              SizedBox(
                width: 150,
                child: Row(
                  children: [
                    Container(width: 50, height: 50, color: Colors.red),
                    const MaxGap(
                      100,
                      crossAxisExtent: 30,
                      color: Colors.orange,
                    ),
                    Container(width: 50, height: 50, color: Colors.green),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '8. MaxGap in Column (Constrained)',
              'MaxGap shrinks vertically when constrained',
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Container(width: 50, height: 30, color: Colors.red),
                    const MaxGap(
                      100,
                      crossAxisExtent: 50,
                      color: Colors.orange,
                    ),
                    Container(width: 50, height: 30, color: Colors.green),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '9. MaxGap.expand',
              'MaxGap that expands in cross-axis',
              SizedBox(
                width: 200,
                height: 100,
                child: Column(
                  children: [
                    Container(width: 50, height: 30, color: Colors.red),
                    const MaxGap.expand(20, color: Colors.cyan),
                    Container(width: 50, height: 30, color: Colors.green),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '10. Gap in Wrap (Horizontal)',
              'Gap works in horizontal Wrap',
              Wrap(
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const Gap(20),
                  Container(width: 50, height: 50, color: Colors.green),
                  const Gap(30),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),
            _buildSection(
              context,
              '11. Gap in Wrap (Vertical)',
              'Gap works in vertical Wrap',
              Wrap(
                direction: Axis.vertical,
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const Gap(20),
                  Container(width: 50, height: 50, color: Colors.green),
                  const Gap(30),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),
            _buildSection(
              context,
              '12. Gap in OverflowBar',
              'Gap works in OverflowBar',
              OverflowBar(
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const Gap(20, color: Colors.pink),
                  Container(width: 50, height: 50, color: Colors.green),
                ],
              ),
            ),
            _buildSection(
              context,
              '13. Gap in Horizontal ListView',
              'Gap detects scroll direction in horizontal ListView',
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(width: 50, height: 80, color: Colors.red),
                    const Gap(30),
                    Container(width: 50, height: 80, color: Colors.green),
                    const Gap(30),
                    Container(width: 50, height: 80, color: Colors.blue),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '14. Gap in Vertical ListView',
              'Gap detects scroll direction in vertical ListView',
              SizedBox(
                height: 200,
                child: ListView(
                  children: [
                    Container(width: 50, height: 50, color: Colors.red),
                    const Gap(30),
                    Container(width: 50, height: 50, color: Colors.green),
                    const Gap(30),
                    Container(width: 50, height: 50, color: Colors.blue),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '15. Gap in SingleChildScrollView',
              'Gap defaults to vertical in SingleChildScrollView',
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(width: 50, height: 50, color: Colors.red),
                      const Gap(20, color: Colors.teal),
                      Container(width: 50, height: 50, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
            _buildSection(
              context,
              '16. SliverGap in Vertical CustomScrollView',
              'SliverGap in vertical scrolling list',
              SizedBox(
                height: 200,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(height: 50, color: Colors.red),
                    ),
                    const SliverGap(30, color: Colors.indigo),
                    SliverToBoxAdapter(
                      child: Container(height: 50, color: Colors.green),
                    ),
                    const SliverGap(30, color: Colors.indigo),
                    SliverToBoxAdapter(
                      child: Container(height: 50, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '17. SliverGap in Horizontal CustomScrollView',
              'SliverGap in horizontal scrolling list',
              SizedBox(
                height: 100,
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        width: 50,
                        height: 80,
                        color: Colors.red,
                      ),
                    ),
                    const SliverGap(30, color: Colors.indigo),
                    SliverToBoxAdapter(
                      child: Container(
                        width: 50,
                        height: 80,
                        color: Colors.green,
                      ),
                    ),
                    const SliverGap(30, color: Colors.indigo),
                    SliverToBoxAdapter(
                      child: Container(
                        width: 50,
                        height: 80,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '18. Gap in Stack (Default Vertical)',
              'Gap defaults to vertical spacing when not in Flex',
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      left: 0,
                      child: Gap(20, color: Colors.yellow),
                    ),
                  ],
                ),
              ),
            ),
            _buildSection(
              context,
              '19. Complex Example: Mixed Gaps',
              'Using Gap and MaxGap together in a complex layout',
              Column(
                children: [
                  Row(
                    children: [
                      Container(width: 40, height: 40, color: Colors.red),
                      const Gap(10),
                      Expanded(
                        child: Container(height: 40, color: Colors.green),
                      ),
                      const Gap(10),
                      Container(width: 40, height: 40, color: Colors.blue),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Container(width: 40, height: 40, color: Colors.purple),
                      const MaxGap(50, color: Colors.orange),
                      Container(width: 40, height: 40, color: Colors.teal),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(40), // Final spacing
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    Widget example,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap(4),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const Gap(12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: example,
          ),
        ],
      ),
    );
  }
}
