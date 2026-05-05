class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.201"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.201/workmux-darwin-arm64.tar.gz"
      sha256 "0101ee836a7ed4425dbd468fceca20648dbcfe831917583f82e121263fc7e8a4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.201/workmux-darwin-amd64.tar.gz"
      sha256 "2f36e9525dd1cfb24765d27f2dbde2e5113469f0fd414b3f39e1c30fc6cf5f13"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.201/workmux-linux-arm64.tar.gz"
      sha256 "b704fe697146b6116f798e89a2f5958d09a8c6fe74bb98b99421a04122d8b79f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.201/workmux-linux-amd64.tar.gz"
      sha256 "a51fa457f8543121a2bcb79022bb6258ed0fd9f72f12f95ed3f530262cc45995"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
