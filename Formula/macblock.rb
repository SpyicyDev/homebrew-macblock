# frozen_string_literal: true

# Homebrew formula for macblock - local DNS sinkhole for macOS
class Macblock < Formula
  include Language::Python::Virtualenv

  desc 'Local DNS sinkhole for macOS using dnsmasq'
  homepage 'https://github.com/SpyicyDev/macblock'

  url 'https://github.com/SpyicyDev/macblock/archive/refs/tags/v0.2.1.tar.gz'
  sha256 '4799c4b0289cbd1aba5a9f534ecb3a867c14063b80fdace8261a57dd5c8863d2'
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
