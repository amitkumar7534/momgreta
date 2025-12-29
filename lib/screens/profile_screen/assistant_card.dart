import 'package:flutter/material.dart';

class AssistantTesterScreen extends StatelessWidget {
  const AssistantTesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Badge Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.lock_clock, color: Colors.redAccent),
                  SizedBox(width: 8),
                  Text(
                    'AI Assistant\nTester',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Development Tool',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Description
          const Text(
            'Test the AI assistant functionality with quick questions or custom messages.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 16),

          // Quick Tests Label
          const Text(
            'Quick Tests:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),

          // Quick Test Buttons
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              QuickTestButton(label: 'Tell me about nutrition tracking'),
              QuickTestButton(label: 'How many calories should I eat per day?'),
              QuickTestButton(label: 'What are the benefits of meal logging?'),
              QuickTestButton(label: 'Explain macronutrients'),
              QuickTestButton(label: 'Help me with portion control'),
            ],
          ),
          const SizedBox(height: 20),

          // Custom Message
          const Text(
            'Custom Message:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),

          // Input and Send Button
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Enter custom test message...',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuickTestButton extends StatelessWidget {
  final String label;

  const QuickTestButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
  }
}