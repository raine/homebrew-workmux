class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.236"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.236/workmux-darwin-arm64.tar.gz"
      sha256 "c35c8a21a405a6d798b8e9354b5e178ddd81fe9190e9cbbeabac2c1ea674f767"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.236/workmux-darwin-amd64.tar.gz"
      sha256 "87b607357c0fa600629293a60c6810706650e3ce94df56a8c47aa5e95e019a3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.236/workmux-linux-arm64.tar.gz"
      sha256 "60c3dc22781c3300693785be48d0b321abd26ae652aa76635facbbb3999bf985"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.236/workmux-linux-amd64.tar.gz"
      sha256 "f398e4dbe8537bbb8bdc2c34cf041f60b391021d12398479827d122db7073baa"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
