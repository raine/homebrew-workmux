class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.43/aarch64-apple-darwin.tar.gz"
      sha256 "eefe1a20847f922408d999b183c33da35016e5d2c90bbbca5488ebf1979a9e3c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.43/x86_64-apple-darwin.tar.gz"
      sha256 "1336c30eab8db01fa4d8640e0cc9ae409ccca6a63c3d7f4411941969e5049496"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.43/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f278f6917c933aba9f187fcb1ba4e7a47b1575f337da3067517a48c09f590cc"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.43/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "505ac8b7d322add87922a961d5e51735d6795219970e97cded3bcda862cae4d6"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
