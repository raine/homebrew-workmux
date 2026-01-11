class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.85"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.85/workmux-darwin-arm64.tar.gz"
      sha256 "b3795074e638e37c473b7d9fd360a1e442627b28df4ac69af808b2c79a01f524"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.85/workmux-darwin-amd64.tar.gz"
      sha256 "ce81479530a4831fb7307ef6428c87dcb68c775f49e3e3e149b4aadc84d1958f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.85/workmux-linux-arm64.tar.gz"
      sha256 "4fd8a4497473f95c12ecc7bbd45370cbf9b810c2d54cee81b5494eb3632f9ab9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.85/workmux-linux-amd64.tar.gz"
      sha256 "988dd3b440b2c4443eadd81e6efaf4c6346a2d692794d4ce71cdd436f1c6ef27"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
