import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              leading: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back, color: Color(0xFF2563EB)),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E40AF),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Create your account to join our community',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Registration Form
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Personal Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF334155),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Name Fields - Side by side
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  label: 'First Name',
                                  hint: 'John',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildTextField(
                                  label: 'Last Name',
                                  hint: 'Doe',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Email
                          _buildTextField(
                            label: 'Email',
                            hint: 'your.email@example.com',
                            prefixIcon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 24),

                          // Password
                          _buildTextField(
                            label: 'Password',
                            hint: '••••••••',
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                            isPasswordVisible: _isPasswordVisible,
                            onPasswordVisibilityToggle: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          const SizedBox(height: 16),

                          // Password Strength Indicator
                          LinearProgressIndicator(
                            value: 0.7,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF22C55E)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Password strength: Strong',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF22C55E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Terms & Conditions
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFBFDBFE),
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    value: _acceptTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        _acceptTerms = value ?? false;
                                      });
                                    },
                                    activeColor: const Color(0xFF2563EB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'I agree to the Terms of Service and Privacy Policy. I also agree to receive news and updates.',
                                    style: TextStyle(
                                      color: Color(0xFF475569),
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Create Account Button
                          _buildPrimaryButton(
                            text: 'Create Account',
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  _acceptTerms) {
                                // Registration logic here
                              }
                            },
                          ),
                          const SizedBox(height: 24),

                          // Social Sign Up Options
                          Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Or sign up with',
                                  style: TextStyle(
                                    color: Color(0xFF64748B),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildSocialButton(
                                      icon: Icons.g_mobiledata,
                                      backgroundColor: Colors.white,
                                      iconColor: Colors.red,
                                    ),
                                    const SizedBox(width: 16),
                                    _buildSocialButton(
                                      icon: Icons.apple,
                                      backgroundColor: Colors.black,
                                      iconColor: Colors.white,
                                    ),
                                    const SizedBox(width: 16),
                                    _buildSocialButton(
                                      icon: Icons.facebook,
                                      backgroundColor: const Color(0xFF1877F2),
                                      iconColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Already Have Account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Color(0xFF2563EB),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? prefixIcon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onPasswordVisibilityToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF334155),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF64748B).withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            obscureText: isPassword && !isPasswordVisible,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: const Color(0xFF94A3B8),
                fontSize: 14,
              ),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: const Color(0xFF64748B), size: 20)
                  : null,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF64748B),
                        size: 20,
                      ),
                      onPressed: onPasswordVisibilityToggle,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: const Color(0xFF2563EB).withOpacity(0.3),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 28,
        ),
      ),
    );
  }
}
