class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.127"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.127/workmux-darwin-arm64.tar.gz"
      sha256 "59b5cecd1e013b579659b9eba7d8c4aaec25a9401dd822d283abe9ad2ef6d27d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.127/workmux-darwin-amd64.tar.gz"
      sha256 "9323f377867a236ea5eee5f2b7e5e8f27c66fdecd91ecd13c54c6c13765a6c25"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.127/workmux-linux-arm64.tar.gz"
      sha256 "22892838038866dda389a43ffe80ea7c748502808a6848f5b213a55e6daf16b4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.127/workmux-linux-amd64.tar.gz"
      sha256 "7699a7400211043c2db69f2d0830744d6599c6dbc2ab5c6526f977fc63a21047"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
