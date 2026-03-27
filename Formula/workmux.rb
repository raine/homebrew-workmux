class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.155"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.155/workmux-darwin-arm64.tar.gz"
      sha256 "99d5dd5120669e33fe6daaad9899c3967341cf9f45fdfdb13452e60b851b1299"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.155/workmux-darwin-amd64.tar.gz"
      sha256 "7cbb50a3f028302c02a08156bc587b47152de54b879c81c057fffc210477aa5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.155/workmux-linux-arm64.tar.gz"
      sha256 "10bb58a9c3e489b04918462e3b58176346aee6b1943dd72aca442842aa796126"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.155/workmux-linux-amd64.tar.gz"
      sha256 "f8b1d60babb3faef01fd05580f039c43215bdb21acd681df225f18da4f03c91e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
