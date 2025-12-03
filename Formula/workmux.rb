class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.38/aarch64-apple-darwin.tar.gz"
      sha256 "25bbfe0f36506e1248a6a61f5d3852f86e376036aa997a1624cc26015d8b608d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.38/x86_64-apple-darwin.tar.gz"
      sha256 "031cb705e47414150ed480b4a197655bf77dc2233394a56f40dbdaeda0d5b841"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.38/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8163c4797928ba0b3e7032ba7217b168254278f092f0ff3c6154dbb7dc02bb61"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
