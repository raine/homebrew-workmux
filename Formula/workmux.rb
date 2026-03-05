class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.131"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.131/workmux-darwin-arm64.tar.gz"
      sha256 "44460c613f2333f26e144b568ea98a8b472a3f28168408238934532138f2c8bb"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.131/workmux-darwin-amd64.tar.gz"
      sha256 "48e98d36fa5be134d14682e4b9b919c453d110a9feed8d930b88a55d99881fbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.131/workmux-linux-arm64.tar.gz"
      sha256 "ba691bf060e92c0677284ae946d7ed84c5cbf8c4596cda7f9f048040ee766617"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.131/workmux-linux-amd64.tar.gz"
      sha256 "e91dd2105cf2b7b864ef04d59ccee82f5a4c59c715f90cc4a3fcba4c46608358"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
