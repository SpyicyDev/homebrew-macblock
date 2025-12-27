# frozen_string_literal: true

# Homebrew formula for macblock - local DNS sinkhole for macOS
class Macblock < Formula
  include Language::Python::Virtualenv

  desc 'Local DNS sinkhole for macOS using dnsmasq'
  homepage 'https://github.com/SpyicyDev/macblock'

  url 'https://github.com/SpyicyDev/macblock/archive/refs/tags/v0.2.4.tar.gz'
  sha256 'c90a0327252be4f557bee3e8adf454c8b6387329743a2fb1689cd66445acf9cd'
  license 'MIT'

  head 'https://github.com/SpyicyDev/macblock.git', branch: 'main'

  depends_on :macos
  depends_on 'dnsmasq'
  depends_on 'python@3.12'

  def install
    virtualenv_install_with_resources(using: 'python@3.12')
  end

  def caveats
    <<~CAVEATS
      To complete installation:
        sudo macblock install
        sudo macblock enable

      Optional:
        sudo macblock update
        macblock status
        macblock doctor

      Documentation:
        #{homepage}
    CAVEATS
  end

  test do
    assert_match 'macblock', shell_output("#{bin}/macblock --version")
    assert_match 'USAGE', shell_output("#{bin}/macblock --help")
  end
end
