class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.134"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.134/workmux-darwin-arm64.tar.gz"
      sha256 "d23910fb37d650508755e18ff33fa11699503daeb7888e0ca5bea106c81d6154"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.134/workmux-darwin-amd64.tar.gz"
      sha256 "587b080952b82993454f34d1819eb2af6136ebca799722456973b19b0b9ddbf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.134/workmux-linux-arm64.tar.gz"
      sha256 "ff958f7e9a9304a4ca68a29f94e9683d45f89b7ccb4b0dcfe58086e0da999f93"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.134/workmux-linux-amd64.tar.gz"
      sha256 "1fca1a08bfceba05c483400480795947523f1a8aa8107c091cd32f11e3c6f116"
    end
  end

  def install
    bin.install "workmux"

    generate_completions_from_executable(bin/"workmux", "completions", shells: [:bash, :fish, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workmux --version")
  end
end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
