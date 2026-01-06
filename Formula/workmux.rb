class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.75"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.75/workmux-darwin-arm64.tar.gz"
      sha256 "132edcddd1a616ba003bdfd266bb3505026f1f8dbcf6c9aad74ce59eb83996b9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.75/workmux-darwin-amd64.tar.gz"
      sha256 "51600051b9eddb07c685c234f8a4674ca7ec551c9e03fda05b01916f0af47755"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.75/workmux-linux-arm64.tar.gz"
      sha256 "7db592acffa294b7baac9185a0cd202397a642a34404864a53950c94bda90a48"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.75/workmux-linux-amd64.tar.gz"
      sha256 "4b21962ccc639f8331218d49c2bb02e26681c7eac41e1a3065ae1de89ac9e02c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
