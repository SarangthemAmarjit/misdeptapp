import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 800;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 12 : 24,
        vertical: isSmallScreen ? 24 : 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Links & Social Media
          isSmallScreen ? _buildVerticalLayout() : _buildHorizontalLayout(),

          const SizedBox(height: 24),
          const Divider(color: Colors.white24),

          // Bottom Row
          const SizedBox(height: 16),
          isSmallScreen
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '© 2025 Government of Singapore, last updated 27 May 2025',
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    children: const [
                      _LinkText('Report Vulnerability'),
                      _LinkText('Privacy Statement'),
                      _LinkText('Terms of Use'),
                      _LinkText('REACH'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      _FooterLogo(
                        label: 'Made with',
                        asset: 'assets/images/isomer-logo.png',
                      ),
                      SizedBox(width: 16),
                      _FooterLogo(
                        label: 'Built by',
                        asset: 'assets/images/open-gov-logo.png',
                      ),
                    ],
                  ),
                ],
              )
              : Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 12,
                children: [
                  const Text(
                    '© 2025 Government of Singapore, last updated 27 May 2025',
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  Wrap(
                    spacing: 16,
                    children: const [
                      _LinkText('Report Vulnerability'),
                      _LinkText('Privacy Statement'),
                      _LinkText('Terms of Use'),
                      _LinkText('REACH'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _FooterLogo(
                        label: 'Made with',
                        asset: 'assets/images/isomer-logo.png',
                      ),
                      _FooterLogo(
                        label: 'Built by',
                        asset: 'assets/images/open-gov-logo.png',
                      ),
                    ],
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ministry of Health links
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Ministry of Health',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _LinkText('Staying healthy'),
              _LinkText('Seeking healthcare'),
              _LinkText('Ageing well'),
              _LinkText('Managing expenses'),
              _LinkText('Newsroom'),
              _LinkText('Resources'),
            ],
          ),
        ),
        // About / Contact
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [SizedBox(height: 24), _LinkText('About us')],
          ),
        ),
        // Social + Contact
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reach us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 12),
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 12),
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 12),
                  FaIcon(
                    FontAwesomeIcons.xTwitter,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 12),
                  FaIcon(
                    FontAwesomeIcons.telegram,
                    color: Colors.white,
                    size: 18,
                  ),

                  SizedBox(width: 12),
                  FaIcon(
                    FontAwesomeIcons.tiktok,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const _LinkText('Contact'),
              const _LinkText('Feedback'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    // Restructure for mobile: stack sections vertically
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ministry of Health links
        const Text(
          'Ministry of Health',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const _LinkText('Staying healthy'),
        const _LinkText('Seeking healthcare'),
        const _LinkText('Ageing well'),
        const _LinkText('Managing expenses'),
        const _LinkText('Newsroom'),
        const _LinkText('Resources'),
        const SizedBox(height: 16),
        const _LinkText('About us'),
        const SizedBox(height: 16),
        const Text(
          'Reach us',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            FaIcon(FontAwesomeIcons.facebookF, color: Colors.white, size: 18),
            SizedBox(width: 12),
            FaIcon(FontAwesomeIcons.instagram, color: Colors.white, size: 18),
            SizedBox(width: 12),
            FaIcon(FontAwesomeIcons.youtube, color: Colors.white, size: 18),
            SizedBox(width: 12),
            FaIcon(FontAwesomeIcons.xTwitter, color: Colors.white, size: 18),
            SizedBox(width: 12),
            FaIcon(FontAwesomeIcons.telegram, color: Colors.white, size: 18),
            SizedBox(width: 12),
            FaIcon(FontAwesomeIcons.tiktok, color: Colors.white, size: 18),
          ],
        ),
        const SizedBox(height: 16),
        const _LinkText('Contact'),
        const _LinkText('Feedback'),
      ],
    );
  }
}

class _LinkText extends StatelessWidget {
  final String label;
  const _LinkText(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ),
    );
  }
}

class _FooterLogo extends StatelessWidget {
  final String label;
  final String asset;
  const _FooterLogo({required this.label, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Colors.white60)),
        const SizedBox(width: 8),
        // Image.asset(asset, height: 24),
      ],
    );
  }
}
