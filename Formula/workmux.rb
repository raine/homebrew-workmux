class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.249"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.249/workmux-darwin-arm64.tar.gz"
      sha256 "03cf646c9ec848662cdd220090de8866541243ab14ea4b4ea23bf736440da4c9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.249/workmux-darwin-amd64.tar.gz"
      sha256 "df9082549009361107ae7812c306fe747162da01651ebf5191dc729f2e8548f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.249/workmux-linux-arm64.tar.gz"
      sha256 "3b214dbb089c0ccda38fe1199cdac1ae1979402e23293db270cdf828e5f44678"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.249/workmux-linux-amd64.tar.gz"
      sha256 "52a41d2a8d0ce948287517c817d63108f230cd467f7aa823f4db91dcc9456148"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
