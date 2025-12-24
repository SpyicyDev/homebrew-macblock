# frozen_string_literal: true

# Homebrew formula for macblock - local DNS sinkhole for macOS
class Macblock < Formula
  include Language::Python::Virtualenv

  desc 'Local DNS sinkhole for macOS using dnsmasq'
  homepage 'https://github.com/SpyicyDev/macblock'

  url 'https://github.com/SpyicyDev/macblock/archive/refs/tags/v0.2.0.tar.gz'
  sha256 '16a580ebca88ca3c1c650f55290fa740cb85876bc9f017c8a1fa073de55382f0'
  license 'MIT'

  head 'https://github.com/SpyicyDev/macblock.git', branch: 'main'

  depends_on :macos
  depends_on 'dnsmasq'
  depends_on 'python'

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~CAVEATS
      To complete installation:
        sudo #{bin}/macblock install
        sudo #{bin}/macblock enable

      Optional:
        sudo #{bin}/macblock update
        #{bin}/macblock status
        #{bin}/macblock doctor

      Documentation:
        #{homepage}
    CAVEATS
  end

  test do
    assert_match 'macblock', shell_output("#{bin}/macblock --version")
    assert_match 'USAGE', shell_output("#{bin}/macblock --help")
  end
end
